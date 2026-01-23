# Zsh Syntax Highlighting
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
	source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

	# override zsh-syntax-highlighting defaults
	ZSH_HIGHLIGHT_STYLES[path]=
	ZSH_HIGHLIGHT_STYLES[path_pathseparator]=fg=black,bold
	ZSH_HIGHLIGHT_STYLES[path_prefix]=
fi
