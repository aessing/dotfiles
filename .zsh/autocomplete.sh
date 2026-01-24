# =============================================================================
# Zsh Autosuggestions Configuration
# =============================================================================
# This script loads the zsh-autosuggestions plugin if installed via Homebrew.
# The plugin suggests commands as you type based on command history.
#
# Installation: brew install zsh-autosuggestions
# =============================================================================

# Load zsh-autosuggestions plugin if available
if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi
