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

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly BLUE='\033[0;34m'
readonly MAGENTA='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly BOLD='\033[1m'
readonly DIM='\033[2m'
readonly RESET='\033[0m'

info() {
  printf "${BLUE}  ℹ${RESET}  %s\n" "$1"
}

success() {
  printf "${GREEN}  ✓${RESET}  %s\n" "$1"
}

warn() {
  printf "${YELLOW}  ⚠${RESET}  %s\n" "$1"
}

error() {
  printf "${RED}  ✗${RESET}  %s\n" "$1" >&2
}

# Print section header
section() {
  local title="$1"
  echo ""
  printf "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
  printf "${BOLD}${CYAN}  ${RESET}  ${BOLD}%s${RESET}\n" "$title"
  printf "${BOLD}${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${RESET}\n"
  echo ""
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
printf "${BOLD}${MAGENTA}╔══════════════════════════════════════════════════════════════════════════════╗${RESET}\n"
printf "${BOLD}${MAGENTA}║${RESET}                                                                              ${BOLD}${MAGENTA}║${RESET}\n"
printf "${BOLD}${MAGENTA}║${RESET}   ${BOLD}🔗  Dotfiles Installation${RESET}                                                  ${BOLD}${MAGENTA}║${RESET}\n"
printf "${BOLD}${MAGENTA}║${RESET}                                                                              ${BOLD}${MAGENTA}║${RESET}\n"
printf "${BOLD}${MAGENTA}╚══════════════════════════════════════════════════════════════════════════════╝${RESET}\n"
echo ""
printf "  ${DIM}Dotfiles:${RESET}  %s\n" "$DOTFILES_DIR"
printf "  ${DIM}System:${RESET}    %s\n" "$OS"
[[ -n "${CODESPACES:-}" ]] && printf "  ${DIM}Environment:${RESET} GitHub Codespaces\n"
[[ "$FORCE_MODE" == true ]] && warn "Force mode enabled - existing files will be overwritten"

# -----------------------------------------------------------------------------
# Install Common Symlinks
# -----------------------------------------------------------------------------
section "Common Dotfiles"

for link in "${COMMON_LINKS[@]}"; do
  src="${DOTFILES_DIR}/${link%%:*}"
  dest="${link#*:}"
  link_file "$src" "$dest"
done

# -----------------------------------------------------------------------------
# Install OS-Specific Symlinks
# -----------------------------------------------------------------------------
if [[ "$OS" == "Darwin" ]]; then
  section "macOS-Specific Dotfiles"
  
  for link in "${MACOS_LINKS[@]}"; do
    src="${DOTFILES_DIR}/${link%%:*}"
    dest="${link#*:}"
    link_file "$src" "$dest"
  done
  
elif [[ "$OS" == "Linux" ]]; then
  section "Linux-Specific Dotfiles"
  
  for link in "${LINUX_LINKS[@]}"; do
    src="${DOTFILES_DIR}/${link%%:*}"
    dest="${link#*:}"
    link_file "$src" "$dest"
  done
  
  # Codespaces-specific
  if [[ -n "${CODESPACES:-}" ]]; then
    section "Codespaces-Specific Dotfiles"
    
    for link in "${CODESPACES_LINKS[@]}"; do
      src="${DOTFILES_DIR}/${link%%:*}"
      dest="${link#*:}"
      link_file "$src" "$dest"
    done
  fi
fi

# -----------------------------------------------------------------------------
# Post-Installation Tasks
# -----------------------------------------------------------------------------
section "Post-Installation Checks"

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

# -----------------------------------------------------------------------------
# Setup Complete
# -----------------------------------------------------------------------------
echo ""
printf "${BOLD}${GREEN}╔══════════════════════════════════════════════════════════════════════════════╗${RESET}\n"
printf "${BOLD}${GREEN}║${RESET}                                                                              ${BOLD}${GREEN}║${RESET}\n"
printf "${BOLD}${GREEN}║${RESET}   ${BOLD}✓  Dotfiles installation complete!${RESET}                                         ${BOLD}${GREEN}║${RESET}\n"
printf "${BOLD}${GREEN}║${RESET}                                                                              ${BOLD}${GREEN}║${RESET}\n"
printf "${BOLD}${GREEN}╚══════════════════════════════════════════════════════════════════════════════╝${RESET}\n"
echo ""

# Show next steps based on OS
if [[ "$OS" == "Darwin" ]]; then
  info "Next steps for macOS:"
  echo "  Restart your terminal or run: source ~/.zshrc"
elif [[ -n "${CODESPACES:-}" ]]; then
  info "Codespaces setup complete!"
  echo "  Your shell will be configured on next terminal launch."
else
  info "Next steps for Linux:"
  echo "  Restart your terminal or run: source ~/.zshrc"
fi
echo ""
