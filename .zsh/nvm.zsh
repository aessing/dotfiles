# =============================================================================
# NVM (Node Version Manager) Configuration
# =============================================================================
# Loads NVM installed via Homebrew for managing Node.js versions.
#
# Installation: brew install nvm
# =============================================================================

export NVM_DIR="$HOME/.nvm"

# Load NVM if installed via Homebrew
if [[ -n "$HOMEBREW_PREFIX" && -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]]; then
  source "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
fi

# Load NVM bash completion
if [[ -n "$HOMEBREW_PREFIX" && -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]]; then
  source "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
fi
