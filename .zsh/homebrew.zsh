# =============================================================================
# Homebrew Configuration
# =============================================================================
# Configures Homebrew environment and preferences.
# HOMEBREW_PREFIX is set in .zshenv for use across all scripts.
# =============================================================================

export HOMEBREW_NO_ANALYTICS=1            # Opt out of telemetry

# Initialize brew environment (prefix, manpath, etc.)
if [[ -n "$HOMEBREW_PREFIX" && -x "$HOMEBREW_PREFIX/bin/brew" ]]; then
  eval "$($HOMEBREW_PREFIX/bin/brew shellenv)"
fi
