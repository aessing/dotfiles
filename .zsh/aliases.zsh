# =============================================================================
# Shell Aliases
# =============================================================================
# Custom aliases for common commands and shortcuts.
# =============================================================================

# Aliases — Architecture helpers
alias rosetta="arch -x86_64 zsh"        # Launch a Rosetta (x86_64) subshell

# Aliases — Core utilities
alias cls="clear"                       # Good 'ol Clear Screen command
alias grep="grep --color=auto"          # Colorized grep when supported
alias ll="ls -al"                       # Long listing with hidden files
alias reload!=". ~/.zshrc"              # Reload the Zsh configuration file

# Xcode Command Line Tools
alias ios="open -a Simulator"           # Open iOS Simulator