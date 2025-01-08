# Ctrl + X + E runs silent execute
bindkey '^X^E' zle-silent-execute

# Alt + Shift + I runs login shell
bindkey '^[I' zle-zsh-login

# Alt + Shift + S runs source shell
bindkey '^[S' zle-source-shell

# Alt + Ctrl + J runs clear and exec
bindkey '^[^J' zle-clear-and-exec

# Alt + I runs list directory
bindkey '^[i' zle-ls

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
