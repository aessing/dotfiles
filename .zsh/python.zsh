# Homebrew Python: prefer brewed shims if brew is available
if command -v brew >/dev/null 2>&1; then
  export PATH="$(brew --prefix python)/libexec/bin:$PATH"
fi