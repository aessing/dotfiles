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
[[ -f ~/.zsh/gcp.zsh ]] && source ~/.zsh/gcp.zsh
[[ -f ~/.zsh/gemini.zsh ]] && source ~/.zsh/gemini.zsh
[[ -f ~/.zsh/homebrew.zsh ]] && source ~/.zsh/homebrew.zsh
[[ -f ~/.zsh/mole.zsh ]] && source ~/.zsh/mole.zsh
[[ -f ~/.zsh/obsidian.zsh ]] && source ~/.zsh/obsidian.zsh
[[ -f ~/.zsh/nvm.zsh ]] && source ~/.zsh/nvm.zsh
[[ -f ~/.zsh/python.zsh ]] && source ~/.zsh/python.zsh
[[ -f ~/.zsh/terraform.zsh ]] && source ~/.zsh/terraform.zsh

# Autocomplete and suggestions
[[ -f ~/.zsh/autocomplete.sh ]] && source ~/.zsh/autocomplete.sh

# Monokai theme for Zsh (load before prompt)
[[ -f ~/.zsh/monokai-style.zsh ]] && source ~/.zsh/monokai-style.zsh
[[ -f ~/.zsh/monokai.zsh ]] && source ~/.zsh/monokai.zsh

# Databricks specific configuration
[[ -f ~/.zsh/databricks.zsh ]] && source ~/.zsh/databricks.zsh

# Terminal prompt configuration (Starship)
[[ -f ~/.zsh/starship.zsh ]] && source ~/.zsh/starship.zsh

# Show system info on shell start (interactive, non-nested, non-VS Code)
if [[ -o interactive ]] && [[ -z "$NEOFETCH_SHOWN" ]] && [[ "$TERM_PROGRAM" != "vscode" ]]; then
  export NEOFETCH_SHOWN=1
  echo ""
  fastfetch
  echo ""
fi
