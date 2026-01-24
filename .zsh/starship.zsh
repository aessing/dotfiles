# =============================================================================
# Starship Prompt Configuration
# =============================================================================
# Configures and initializes the Starship cross-shell prompt.
# Includes automatic distro icon detection for the prompt.
#
# Installation: brew install starship
# Config file:  ~/.config/starship.toml
# =============================================================================

# Starship prompt configuration
export STARSHIP_CONFIG="$HOME/.config/starship.toml"

# Detect distro to pick an icon (requires a font with font-logos glyphs)
_starship_detect_distro() {
  local distro=""

  if [[ -f /etc/os-release ]]; then
    distro=$(awk -F= '/^ID=/{print tolower($2)}' /etc/os-release)
  elif [[ -f /etc/lsb-release ]]; then
    distro=$(awk -F= '/^DISTRIB_ID=/{print tolower($2)}' /etc/lsb-release)
  elif [[ -f /System/Library/CoreServices/SystemVersion.plist ]]; then
    distro="macos"
  fi

  case ${distro:-} in
    *kali*)                  echo "";;
    *arch*)                  echo "";;
    *debian*)                echo "";;
    *raspbian*)              echo "";;
    *ubuntu*)                echo "";;
    *elementary*)            echo "";;
    *fedora*)                echo "";;
    *coreos*)                echo "";;
    *gentoo*)                echo "";;
    *mageia*)                echo "";;
    *centos*)                echo "";;
    *opensuse*|*tumbleweed*) echo "";;
    *sabayon*)               echo "";;
    *slackware*)             echo "";;
    *linuxmint*)             echo "";;
    *alpine*)                echo "";;
    *aosc*)                  echo "";;
    *nixos*)                 echo "";;
    *devuan*)                echo "";;
    *manjaro*)               echo "";;
    *rhel*)                  echo "";;
    *almalinux*)             echo "";;
    *rockylinux*)            echo "";;
    *macos*)                 echo "";;
    *)                       echo "";;
  esac
}

export STARSHIP_DISTRO="$(_starship_detect_distro)"
unset -f _starship_detect_distro

# Disable Warp-specific tweaks when not in a local Warp shell session
if [[ -z ${WARP_IS_LOCAL_SHELL_SESSION} ]]; then
  export STARSHIP_NOWARP=1
fi

# Load Starship
eval "$(starship init zsh)"
