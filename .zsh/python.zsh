# =============================================================================
# Python Configuration
# =============================================================================
# Configures Homebrew-installed Python to be preferred over system Python.
#
# Installation: brew install python
# =============================================================================

# Homebrew Python: prefer brewed shims if Homebrew is available
if [[ -n "$HOMEBREW_PREFIX" && -d "$HOMEBREW_PREFIX/opt/python/libexec/bin" ]]; then
  export PATH="$HOMEBREW_PREFIX/opt/python/libexec/bin:$PATH"
fi
