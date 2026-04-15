# =============================================================================
# Mole Configuration
# =============================================================================
# Configures Mole environment and preferences.
# =============================================================================

# Mole shell completion
if [[ -o interactive ]]; then
    if (( ! $+functions[compdef] )); then
        autoload -Uz compinit
        compinit
    fi

    if output="$(mole completion zsh 2>/dev/null)"; then
        eval "$output"
    fi
fi
