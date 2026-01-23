# Show 256-color table with codes
function colormap() {
  for i in {0..255}; do
    print -Pn "%K{$i}  %k%F{$i}${(l:3:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}
  done
}
