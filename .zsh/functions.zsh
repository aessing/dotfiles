# =============================================================================
# Shell Functions
# =============================================================================
# Custom shell functions for various utilities.
# =============================================================================

# Show 256-color table with codes
function colormap() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
  done
}

# Extract any archive
function extract() {
  case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz)  tar xzf $1 ;;
    *.zip)     unzip $1 ;;
    *.gz)      gunzip $1 ;;
    *)         echo "Unknown format" ;;
  esac
}
# Create directory and cd into it
function mkcd() { mkdir -p "$1" && cd "$1" }

