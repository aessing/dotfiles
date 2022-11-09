# -----------------------------------------------------------------------------
# ~/.zshenv — Minimal environment for all zsh invocations
# Purpose: export essential environment variables and PATH entries early.
# Notes: Keep this file lightweight and POSIX-safe; avoid interactive-only commands.
# Use ~/.zprofile or ~/.zshrc for login/interactive configuration.
# Is executed for all zsh invocations, including non-interactive shells. and 
# in front of .zprofile and .zshrc.
# -----------------------------------------------------------------------------

# Encoding
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# History
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_DUPS      # Don't record duplicates
setopt HIST_IGNORE_SPACE     # Don't record commands starting with space
setopt SHARE_HISTORY         # Share history between sessions
setopt APPEND_HISTORY        # Append instead of overwrite

# Homebrew prefix (dynamically detected, works for any architecture)
# We need to find brew first, then use its --prefix
if [[ -x /opt/homebrew/bin/brew ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -x /usr/local/bin/brew ]]; then
  export HOMEBREW_PREFIX="/usr/local"
fi

# Path variable
export PATH=/usr/local/bin:/usr/local/sbin:"$PATH"

# Add .local/bin to PATH if it exists
# Used for uv installations.
[ -d "$HOME/.local/bin" ] &&  export PATH="$HOME/.local/bin:$PATH"
