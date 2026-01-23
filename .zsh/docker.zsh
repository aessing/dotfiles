# Docker CLI completions (optional)
if [[ -d "$HOME/.docker/completions" ]]; then
  fpath=("$HOME/.docker/completions" $fpath)

  # Already loaded with monokai theme later.
  # autoload -Uz compinit
  # compinit
fi
