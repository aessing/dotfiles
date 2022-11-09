# =============================================================================
# Docker Configuration
# =============================================================================
# Sets up Docker CLI completions for zsh.
#
# Installation: brew install --cask docker
# =============================================================================

# Docker CLI completions (optional)
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)

  # Already loaded with monokai theme later.
  # autoload -Uz compinit
  # compinit
fi
