# =============================================================================
# Zsh Syntax Highlighting (Monokai Theme)
# =============================================================================
# Loads zsh-syntax-highlighting with custom Monokai-inspired styling.
# Provides real-time syntax highlighting as you type commands.
#
# Installation: brew install zsh-syntax-highlighting
# =============================================================================

# Monokai theme — colors, keybindings, and completion
# Prompt handled by Starship

# ls colors
export CLICOLOR=1
export LSCOLORS=gxfxexdxcxegedabagacad

# man colors
export LESS_TERMCAP_mb=$'\e[1;35m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# Up/down arrow history navigation
zmodload zsh/zle
autoload -Uz +X add-zle-hook-widget
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "$terminfo[kcuu1]" up-line-or-beginning-search
bindkey "$terminfo[kcud1]" down-line-or-beginning-search

# Colors
autoload -U colors
colors

# Define color variables (used by TIMEFMT)
for COLOR in RED GREEN BLUE YELLOW MAGENTA WHITE BLACK CYAN; do
  eval TIME_$COLOR='$fg[${(L)COLOR}]'
  eval TIME_BRIGHT_$COLOR='$fg_bold[${(L)COLOR}]'
done
TIME_RESET="$reset_color"

# Report command running time if > 3 seconds
export REPORTTIME=3
export TIMEFMT="
${TIME_BRIGHT_BLACK}elapsed: ${TIME_WHITE}%*Es ${TIME_BRIGHT_BLACK}(user: ${TIME_WHITE}%*Us ${TIME_BRIGHT_BLACK}system: ${TIME_WHITE}%*Ss${TIME_BRIGHT_BLACK}) cpu: ${TIME_WHITE}%P ${TIME_BRIGHT_BLACK}memory: ${TIME_WHITE}%MK"

# Completion
autoload -U compinit && compinit

setopt auto_list
setopt auto_menu
setopt always_to_end

zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
bindkey '^[[Z' reverse-menu-complete
