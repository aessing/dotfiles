# Homebrew setup
export HOMEBREW_NO_ANALYTICS=1            # Opt out of telemetry

# Initialize brew environment (prefix, manpath, etc.)
if command -v /opt/homebrew/bin/brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi