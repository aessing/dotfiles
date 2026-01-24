# -----------------------------------------------------------------------------
# ~/.zshrc — Interactive shell configuration
# Purpose: Runs for interactive shells after ~/.zshenv and ~/.zprofile.
# Use this for prompts, aliases, functions, completion, and other interactive tweaks.
# -----------------------------------------------------------------------------

# General ZSH configuration file
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh

# App Specitic Zsh configuration file
[[ -f ~/.zsh/azure_functions.zsh ]] && source ~/.zsh/azure_functions.zsh
[[ -f ~/.zsh/docker.zsh ]] && source ~/.zsh/docker.zsh
[[ -f ~/.zsh/dotnet.zsh ]] && source ~/.zsh/dotnet.zsh
[[ -f ~/.zsh/homebrew.zsh ]] && source ~/.zsh/homebrew.zsh
[[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh
[[ -f ~/.zsh/python.zsh ]] && source ~/.zsh/python.zsh

# Autocomplete and suggestions
[[ -f ~/.zsh/autocomplete.sh ]] && source ~/.zsh/autocomplete.sh

# Monokai theme for Zsh (load before prompt)
[[ -f ~/.zsh/monokai-style.zsh ]] && source ~/.zsh/monokai-style.zsh
[[ -f ~/.zsh/monokai.zsh ]] && source ~/.zsh/monokai.zsh

# Terminal prompt configuration (Starship)
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh
