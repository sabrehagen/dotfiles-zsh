# Tree directory widget that runs tree
zle-tree() {
  zle-exec-inline tree
}
zle -N zle-tree

zle-treed-depth-2() {
  zle-exec-inline treed -L 2
}
zle -N zle-treed-depth-2

zle-treed-depth-3() {
  zle-exec-inline treed -L 3
}
zle -N zle-treed-depth-3

zle-treed-depth-4() {
  zle-exec-inline treed -L 4
}
zle -N zle-treed-depth-4

zle-treed-depth-5() {
  zle-exec-inline treed -L 5
}
zle -N zle-treed-depth-5

zle-treed-depth-6() {
  zle-exec-inline treed -L 6
}
zle -N zle-treed-depth-6

tree-depth-2() {
  zle-exec-inline tree -L 2
}
zle -N tree-depth-2

zle-tree-depth-3() {
  zle-exec-inline tree -L 3
}
zle -N zle-tree-depth-3

zle-tree-depth-4() {
  zle-exec-inline tree -L 4
}
zle -N zle-tree-depth-4

zle-tree-depth-5() {
  zle-exec-inline tree -L 5
}
zle -N zle-tree-depth-5

zle-tree-depth-6() {
  zle-exec-inline tree -L 6
}
zle -N zle-tree-depth-6

# Mode widget for running tree commands
zle-alt-shift-t-map() {
  local -A keys
  keys=(
    "d" "zle-treed"
    "D" "zle-tree"
    "2" "zle-treed-depth-2"
    "3" "zle-treed-depth-3"
    "4" "zle-treed-depth-4"
    "5" "zle-treed-depth-5"
    "6" "zle-treed-depth-6"
    "@" "zle-tree-depth-2"
    "#" "zle-tree-depth-3"
    "$" "zle-tree-depth-4"
    "%" "zle-tree-depth-5"
    "^" "zle-tree-depth-6"
  )

  read -k1 -t 3 key || return
  if (( ${+keys[$key]} )); then
    zle ${keys[$key]}
  fi
}
zle -N zle-alt-shift-t-map
