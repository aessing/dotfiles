# =============================================================================
# Shell Aliases
# =============================================================================
# Custom aliases for common commands and shortcuts.
# =============================================================================

# Architecture helpers
alias rosetta="arch -x86_64 zsh"        # Launch a Rosetta (x86_64) subshell

# Core utilities
alias cls="clear"                       # Good 'ol Clear Screen command
alias grep="grep --color=auto"          # Colorized grep when supported
alias cat="bat"                         # Better cat (brew install bat)
alias ll="eza --icons -la"              # Long listing with icons, better ls
alias ls="eza --icons"                  # Better ls with icons
alias reload!=". ~/.zshrc"              # Reload the Zsh configuration file

# Git shortcuts (beyond .gitconfig)
alias g="git"
alias gs="git status"
alias gp="git push"
alias gl="git pull"

# Navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"

# Safety
alias rm="rm -i"                        # Confirm before deleting
alias cp="cp -i"                        # Confirm before overwriting
alias mv="mv -i"                        # Confirm before overwriting

# Xcode Command Line Tools
alias ios="xcrun simctl boot 'iPhone 17 Pro Max' 2>/dev/null; open -a Simulator"
alias ios-list="xcrun simctl list devices iphone"
alias ipados="xcrun simctl boot 'iPad Pro 11-inch (M5)  ' 2>/dev/null; open -a Simulator"
alias ipados-list="xcrun simctl list devices ipad"
alias tvos="xcrun simctl boot 'Apple TV 4K (3rd generation)' 2>/dev/null; open -a Simulator"
alias tvos-list="xcrun simctl list devices tv"
alias watchos="xcrun simctl boot 'Apple Watch Ultra 3 (49mm)' 2>/dev/null; open -a Simulator"
alias watchos-list="xcrun simctl list devices watch"
alias rmxdd="rm -rf ~/Library/Developer/Xcode/DerivedData"
