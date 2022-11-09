# -----------------------------------------------------------------------------
# ~/.zprofile — Login shell initialization
# Purpose: Execute configuration for login shells; runs once per login session.
# Notes: Sourced after ~/.zshenv and before ~/.zshrc.
# Use this for commands that should run on login (not for every interactive shell).
# Keep interactive-only commands in ~/.zshrc instead.
# -----------------------------------------------------------------------------

# Set initial shell level
export INIT_SHELL_LEVEL=$SHLVL
