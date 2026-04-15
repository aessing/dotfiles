# =============================================================================
# DBX specific configuration
# =============================================================================
# Specific aliases and environment variables for working with Databricks (DBX)
# CLI and tools.
#
# =============================================================================

# DBX specific aliases
if [[ -f /usr/local/bin/dbexec ]]; then
  alias llm='dbexec repo run llm'
  alias isaac="dbexec repo run isaac"
fi

# DBX specific parameneters
if [[ -f /usr/local/bin/dbexec ]]; then
  export I_DANGEROUSLY_OPT_IN_TO_UNSUPPORTED_ALPHA_TOOLS=true
  export MCP_PRIVACY_SUMMARIZATION_ENABLED=false
fi
