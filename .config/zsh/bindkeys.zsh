# Ctrl + X + E runs silent execute
bindkey '^X^E' zle-silent-execute

# Alt + Shift + C runs load last command output
bindkey '^[C' zle-last-command-output

# Alt + Shift + A runs git add
bindkey '^[A' zle-git-add

# Ctrl + Alt + Shift + A runs git added
bindkey '^[^A' zle-git-added

# Alt + Shift + D runs git diff
bindkey '^[D' zle-git-diff

# Alt + Shift + S runs git status
bindkey '^[S' zle-git-status

# Alt + Shift + I runs login shell
bindkey '^[I' zle-zsh-login

# Alt + Shift + R runs source shell
bindkey '^[R' zle-source-shell

# Alt + Ctrl + J runs clear and exec
bindkey '^[^J' zle-clear-and-exec

# Alt + T runs tree directory
bindkey '^[t' zle-tree

# Alt + Shift + T runs tree mode
bindkey '^[T' zle-alt-shift-t-map

# Alt + U runs up directory
bindkey '^[u' zle-cd-up

# Alt + Minus runs back directory
bindkey '^[-' zle-cd-back

# Alt + Shift + Minus forward directory
bindkey '^[_' zle-cd-forward

# Ctrl + K runs list directory
bindkey '^k' zle-ls

# Duplicate bindings

# Alt + Ctrl + K runs tree 3
bindkey '^[^K' tree-depth-3

# Additional zle bindings
bindkey '^[.' insert-last-word
bindkey '^[b' vi-backward-word
bindkey '^[d' kill-word
bindkey '^[f' vi-forward-word
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^b' backward-char
bindkey '^d' delete-char
bindkey '^f' forward-char
bindkey '^p' up-line-or-history
bindkey '^r' fzf-history-widget
bindkey '^w' vi-backward-kill-word

# zsh-history-substring-search plugin configuration

# Alt + I runs search history backwards
bindkey '^[i' history-substring-search-up

# Alt + Shift + I runs search history forwards
bindkey '^[I' history-substring-search-down
