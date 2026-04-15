# =============================================================================
# GCP Configuration
# =============================================================================
# Settings for Google Cloud CLI.
#
# Installation: brew install gcloud-cli
# =============================================================================

# Disable usage reporting
export CLOUDSDK_CORE_DISABLE_USAGE_REPORTING=true

# Google Cloud SDK
[[ -f "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc" ]] && source "/opt/homebrew/share/google-cloud-sdk/path.zsh.inc"
