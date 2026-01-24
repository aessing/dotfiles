#!/usr/bin/env bash
# =============================================================================
# macOS System Defaults Configuration
# =============================================================================
# Sets reasonable macOS defaults for a better user experience.
# Run this script once after a fresh macOS installation.
#
# Usage: ./set-macOS-defaults.sh
#
# Original idea and some settings from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.macos
#
# Note: Some changes may require a logout/restart to take effect.
# =============================================================================

# -----------------------------------------------------------------------------
# Finder
# -----------------------------------------------------------------------------

# Show the ~/Library folder (hidden by default)
chflags nohidden ~/Library