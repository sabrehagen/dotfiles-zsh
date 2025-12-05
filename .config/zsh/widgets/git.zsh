# Git add widget that runs git a and prints git status
zle-git-add() {
  zle-exec-inline "a . && s"
}
zle -N zle-git-add

# Git add widget that runs git aa
zle-git-added() {
  zle-exec-inline aa
}
zle -N zle-git-added

# Git diff widget that runs git d
zle-git-diff() {
  zle-exec-inline d
}
zle -N zle-git-diff

# Git status widget that runs git s
zle-git-status() {
  zle-exec-inline s
}
zle -N zle-git-status
