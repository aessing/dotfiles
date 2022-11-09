# =============================================================================
# Zsh Syntax Highlighting (Monokai Theme)
# =============================================================================
# Loads zsh-syntax-highlighting with custom Monokai-inspired styling.
# Provides real-time syntax highlighting as you type commands.
#
# Installation: brew install zsh-syntax-highlighting
# =============================================================================

# Zsh Syntax Highlighting
if [[ -n "$HOMEBREW_PREFIX" && -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/highlighters"
	source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

	# override zsh-syntax-highlighting defaults
	ZSH_HIGHLIGHT_STYLES[path]=
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[path_prefix]=
fi
