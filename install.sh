#!/usr/bin/env bash
# =============================================================================
# Dotfiles Installation Script
# =============================================================================
# Cross-platform script to symlink dotfiles to home directory.
# Works on macOS, Linux, and GitHub Codespaces.
#
# Usage: ./install.sh [--force]
#
# Options:
#   --force    Overwrite existing files without creating backups
# =============================================================================

set -euo pipefail
IFS=$'\n\t'

# -----------------------------------------------------------------------------
# Configuration
# -----------------------------------------------------------------------------
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OS="$(uname -s)"
FORCE_MODE=false
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Parse arguments
for arg in "$@"; do
  case $arg in
    --force) FORCE_MODE=true ;;
  esac
done

# -----------------------------------------------------------------------------
# Helper Functions
# -----------------------------------------------------------------------------
info() {
  printf "\033[0;34m[INFO]\033[0m %s\n" "$1"
}

success() {
  printf "\033[0;32m[OK]\033[0m %s\n" "$1"
}

warn() {
  printf "\033[0;33m[WARN]\033[0m %s\n" "$1"
}

error() {
  printf "\033[0;31m[ERROR]\033[0m %s\n" "$1" >&2
}

# Create symlink with backup of existing files
link_file() {
  local src="$1"
  local dest="$2"
  
  # Skip if source doesn't exist
  if [[ ! -e "$src" ]]; then
    warn "Source not found, skipping: $src"
    return 0
  fi
  
  # Create parent directory if needed
  mkdir -p "$(dirname "$dest")"
  
  # Handle existing files/symlinks
  if [[ -e "$dest" || -L "$dest" ]]; then
    # Check if already correctly linked
    if [[ -L "$dest" ]]; then
      local current_target
      current_target="$(readlink "$dest")"
      if [[ "$current_target" == "$src" ]]; then
        success "Already linked: $dest"
        return 0
      fi
    fi
    
    if [[ "$FORCE_MODE" == true ]]; then
      # Force mode: remove existing file
      rm -rf "$dest"
      info "Removed existing: $dest"
    else
      # Backup existing file
      local backup="${dest}.backup.$(date +%Y%m%d%H%M%S)"
      warn "Backing up existing file: $dest → $backup"
      mv "$dest" "$backup"
    fi
  fi
  
  # Create symlink
  ln -s "$src" "$dest"
  success "Linked: $dest → $src"
}

# -----------------------------------------------------------------------------
# Symlink Definitions
# -----------------------------------------------------------------------------
# Define symlinks as arrays: source (relative to dotfiles) and destination

# Common files (all platforms)
declare -a COMMON_LINKS=(
  # Zsh configuration
  ".zshrc:$HOME/.zshrc"
  ".zshenv:$HOME/.zshenv"
  ".zprofile:$HOME/.zprofile"
  ".zsh:$HOME/.zsh"
  
  # Git configuration
  ".gitconfig:$HOME/.gitconfig"
  
  # Starship prompt
  ".config/starship.toml:$XDG_CONFIG_HOME/starship.toml"
)

# macOS-only files
declare -a MACOS_LINKS=(
  # 1Password SSH agent configuration
  ".config/1Password/ssh/agent.toml:$XDG_CONFIG_HOME/1Password/ssh/agent.toml"
  
  # SSH configuration (uses 1Password agent on macOS)
  ".ssh/config:$HOME/.ssh/config"
  ".ssh/1Password/config:$HOME/.ssh/1Password/config"
)

# Linux-only files (including Codespaces)
declare -a LINUX_LINKS=(
  # Add Linux-specific symlinks here
  # SSH config without 1Password agent for Codespaces
)

# Codespaces-specific files
declare -a CODESPACES_LINKS=(
  # Add Codespaces-specific symlinks here
)

# -----------------------------------------------------------------------------
# Main Installation
# -----------------------------------------------------------------------------
echo ""
info "=============================================="
info "  Dotfiles Installation"
info "=============================================="
echo ""
info "Dotfiles directory: $DOTFILES_DIR"
info "Detected OS: $OS"
[[ -n "${CODESPACES:-}" ]] && info "Running in GitHub Codespaces"
[[ "$FORCE_MODE" == true ]] && warn "Force mode enabled - existing files will be overwritten"
echo ""

# -----------------------------------------------------------------------------
# Install Common Symlinks
# -----------------------------------------------------------------------------
info "Linking common dotfiles..."
echo ""

for link in "${COMMON_LINKS[@]}"; do
  src="${DOTFILES_DIR}/${link%%:*}"
  dest="${link#*:}"
  link_file "$src" "$dest"
done

echo ""

# -----------------------------------------------------------------------------
# Install OS-Specific Symlinks
# -----------------------------------------------------------------------------
if [[ "$OS" == "Darwin" ]]; then
  info "Linking macOS-specific dotfiles..."
  echo ""
  
  for link in "${MACOS_LINKS[@]}"; do
    src="${DOTFILES_DIR}/${link%%:*}"
    dest="${link#*:}"
    link_file "$src" "$dest"
  done
  
  echo ""
  
elif [[ "$OS" == "Linux" ]]; then
  info "Linking Linux-specific dotfiles..."
  echo ""
  
  for link in "${LINUX_LINKS[@]}"; do
    src="${DOTFILES_DIR}/${link%%:*}"
    dest="${link#*:}"
    link_file "$src" "$dest"
  done
  
  # Codespaces-specific
  if [[ -n "${CODESPACES:-}" ]]; then
    info "Linking Codespaces-specific dotfiles..."
    echo ""
    
    for link in "${CODESPACES_LINKS[@]}"; do
      src="${DOTFILES_DIR}/${link%%:*}"
      dest="${link#*:}"
      link_file "$src" "$dest"
    done
  fi
  
  echo ""
fi

# -----------------------------------------------------------------------------
# Post-Installation Tasks
# -----------------------------------------------------------------------------
info "Running post-installation tasks..."
echo ""

# Create .config directory if it doesn't exist
mkdir -p "$XDG_CONFIG_HOME"

# Ensure .zsh directory scripts are sourced correctly
if [[ -d "$HOME/.zsh" ]]; then
  success "Zsh configuration directory is in place"
fi

# Check if starship is installed
if command -v starship &>/dev/null; then
  success "Starship prompt is installed"
else
  warn "Starship not installed. Install with: brew install starship (macOS) or cargo install starship (Linux)"
fi

echo ""

# -----------------------------------------------------------------------------
# Setup Complete
# -----------------------------------------------------------------------------
success "=============================================="
success "  Dotfiles installation complete!"
success "=============================================="
echo ""

# Show next steps based on OS
if [[ "$OS" == "Darwin" ]]; then
  info "Next steps for macOS:"
  echo "  1. Run ./setup_macos.sh for full macOS setup (Homebrew, packages, preferences)"
  echo "  2. Restart your terminal or run: source ~/.zshrc"
elif [[ -n "${CODESPACES:-}" ]]; then
  info "Codespaces setup complete!"
  echo "  Your shell will be configured on next terminal launch."
else
  info "Next steps for Linux:"
  echo "  1. Install required packages (starship, zsh-autosuggestions, etc.)"
  echo "  2. Restart your terminal or run: source ~/.zshrc"
fi
echo ""
