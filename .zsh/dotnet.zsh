# =============================================================================
# .NET SDK Configuration
# =============================================================================
# Environment settings for .NET SDK installed via Homebrew.
#
# Installation: brew install dotnet
# =============================================================================

# .NET SDK settings (only if Homebrew is available)
if [[ -n "$HOMEBREW_PREFIX" ]]; then
  export DOTNET_ROOT="$HOMEBREW_PREFIX/opt/dotnet/libexec"
fi
export DOTNET_CLI_TELEMETRY_OPTOUT=1   # Disable CLI telemetry
