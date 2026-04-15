# =============================================================================
# Obsidian CLI Configuration
# =============================================================================
# Adds the Obsidian CLI to PATH if the application is installed.
# =============================================================================

if [[ -d "/Applications/Obsidian.app/Contents/MacOS" ]]; then
  export PATH="$PATH:/Applications/Obsidian.app/Contents/MacOS"
fi
