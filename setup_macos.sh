#!/usr/bin/env bash
# =============================================================================
# macOS Initial Setup Script
# =============================================================================
# This script bootstraps a fresh macOS installation by:
#   1. Installing Homebrew (the macOS package manager)
#   2. Installing Git via Homebrew
#   3. Cloning the dotfiles repository to ~/.dotfiles
#   4. Installing packages from a Brewfile (user selectable)
#
# Usage: /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/aessing/dotfiles/main/setup_macos.sh)"
#
# Note: Run this script on a fresh macOS installation.
#       Requires an internet connection and administrator privileges.
# =============================================================================

# -----------------------------------------------------------------------------
# Strict Mode & Error Handling
# -----------------------------------------------------------------------------
set -euo pipefail  # Exit on error, undefined vars, and pipe failures
IFS=$'\n\t'        # Safer word splitting

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------
readonly DOTFILES_REPO="https://github.com/aessing/dotfiles.git"
readonly DOTFILES_DIR="$HOME/.dotfiles"

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------

# Print formatted status messages
info() {
  printf "\033[0;34m[INFO]\033[0m %s\n" "$1"
}

success() {
  printf "\033[0;32m[OK]\033[0m %s\n" "$1"
}

error() {
  printf "\033[0;31m[ERROR]\033[0m %s\n" "$1" >&2
}

# Check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# -----------------------------------------------------------------------------
# Pre-flight Checks
# -----------------------------------------------------------------------------

# Ensure we're running on macOS
if [[ "$(uname -s)" != "Darwin" ]]; then
  error "This script is intended for macOS only."
  exit 1
fi

# Ensure we're not running as root (Homebrew doesn't like that)
if [[ "$(id -u)" -eq 0 ]]; then
  error "Do not run this script as root. Homebrew will request sudo when needed."
  exit 1
fi

info "Starting macOS setup..."

# -----------------------------------------------------------------------------
# Step 1: Install Homebrew
# -----------------------------------------------------------------------------
info "Checking for Homebrew..."

if command_exists brew; then
  success "Homebrew is already installed."
else
  info "Installing Homebrew..."
  
  # Install Homebrew using the official installation script
  # The script is fetched via HTTPS from GitHub and executed
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add Homebrew to PATH for this session (Apple Silicon path)
  if [[ -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  # Intel Mac path
  elif [[ -x /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
  
  # Verify installation
  if command_exists brew; then
    success "Homebrew installed successfully."
  else
    error "Homebrew installation failed."
    exit 1
  fi
fi

# Update Homebrew to latest version
info "Updating Homebrew..."
brew update
success "Homebrew is up to date."

# -----------------------------------------------------------------------------
# Step 2: Install Git via Homebrew
# -----------------------------------------------------------------------------
info "Checking for Git..."

# Check if Git is installed via Homebrew (not just system Git)
if brew list git &>/dev/null; then
  success "Git is already installed via Homebrew."
else
  info "Installing Git via Homebrew..."
  brew install git
  
  # Verify installation
  if brew list git &>/dev/null; then
    success "Git installed successfully ($(git --version))."
  else
    error "Git installation failed."
    exit 1
  fi
fi

# -----------------------------------------------------------------------------
# Step 3: Clone Dotfiles Repository
# -----------------------------------------------------------------------------
info "Checking for dotfiles repository..."

if [[ -d "$DOTFILES_DIR" ]]; then
  # Directory exists - check if it's a git repo
  if [[ -d "$DOTFILES_DIR/.git" ]]; then
    success "Dotfiles repository already exists at $DOTFILES_DIR"
    info "Pulling latest changes..."
    git -C "$DOTFILES_DIR" pull --ff-only
    success "Dotfiles updated."
  else
    error "$DOTFILES_DIR exists but is not a git repository."
    error "Please remove or rename it and run this script again."
    exit 1
  fi
else
  info "Cloning dotfiles repository to $DOTFILES_DIR..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
  
  # Verify clone
  if [[ -d "$DOTFILES_DIR/.git" ]]; then
    success "Dotfiles repository cloned successfully."
  else
    error "Failed to clone dotfiles repository."
    exit 1
  fi
fi

# -----------------------------------------------------------------------------
# Step 4: Install Packages from Brewfile
# -----------------------------------------------------------------------------
info "Searching for available Brewfiles..."

# Find all Brewfiles in the dotfiles directory
brewfiles=()
while IFS= read -r -d '' file; do
  brewfiles+=("$file")
done < <(find "$DOTFILES_DIR" -maxdepth 1 -name ".Brewfile*" -type f -print0 | sort -z)

# Check if any Brewfiles were found
if [[ ${#brewfiles[@]} -eq 0 ]]; then
  error "No Brewfiles found in $DOTFILES_DIR"
  info "Skipping package installation."
else
  # Add "Skip" option
  echo ""
  info "Available Brewfiles:"
  echo ""
  
  # Display menu with numbered options
  for i in "${!brewfiles[@]}"; do
    filename=$(basename "${brewfiles[$i]}")
    # Count packages in each Brewfile
    pkg_count=$(grep -cE "^(brew|cask|tap) " "${brewfiles[$i]}" 2>/dev/null || echo "0")
    printf "  %d) %s (%s packages)\n" "$((i + 1))" "$filename" "$pkg_count"
  done
  printf "  %d) Skip package installation\n" "$((${#brewfiles[@]} + 1))"
  echo ""
  
  # Get user selection with input validation
  selected_brewfile=""
  while true; do
    printf "\033[0;34m[INPUT]\033[0m Select a Brewfile (1-%d): " "$((${#brewfiles[@]} + 1))"
    read -r selection
    
    # Validate input is a number
    if ! [[ "$selection" =~ ^[0-9]+$ ]]; then
      error "Please enter a valid number."
      continue
    fi
    
    # Check if user chose to skip
    if [[ "$selection" -eq "$((${#brewfiles[@]} + 1))" ]]; then
      info "Skipping package installation."
      break
    fi
    
    # Validate selection is within range
    if [[ "$selection" -ge 1 && "$selection" -le "${#brewfiles[@]}" ]]; then
      selected_brewfile="${brewfiles[$((selection - 1))]}"
      break
    else
      error "Invalid selection. Please choose a number between 1 and $((${#brewfiles[@]} + 1))."
    fi
  done
  
  # Install packages if a Brewfile was selected
  if [[ -n "$selected_brewfile" ]]; then
    info "Installing packages from $(basename "$selected_brewfile")..."
    echo ""
    
    # Run brew bundle with the selected Brewfile
    # --no-lock: Don't generate a Brewfile.lock.json
    # --file: Specify the Brewfile to use
    if brew bundle --no-lock --file="$selected_brewfile"; then
      success "All packages installed successfully."
    else
      # brew bundle returns non-zero if some packages failed
      # but may have installed others successfully
      error "Some packages may have failed to install."
      info "You can re-run 'brew bundle --file=$selected_brewfile' to retry."
    fi
  fi
fi

# -----------------------------------------------------------------------------
# Setup Complete
# -----------------------------------------------------------------------------
echo ""
success "=============================================="
success "  macOS setup complete!"
success "=============================================="
echo ""
info "Next steps:"
echo "  1. cd $DOTFILES_DIR"
echo "  2. Run the dotfiles installation/linking script"
echo "  3. Run ./Install/set-macOS-defaults.sh for system preferences"
echo ""
