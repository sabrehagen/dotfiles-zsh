# Ctrl + X + E runs silent execute
bindkey '^X^E' zle-silent-execute

# Alt + Shift + C runs buffer last command output
bindkey '^[C' zle-buffer-last-command-output

# Alt + Shift + X runs buffer output of exec zle buffer
bindkey '^[X' zle-buffer-output-of-exec-zle-buffer

# Alt + Shift + A runs git add
bindkey '^[A' zle-git-add

# Ctrl + Alt + Shift + A runs git added
bindkey '^[^A' zle-git-added

# Alt + Shift + D runs git diff
bindkey '^[D' zle-git-diff

# Alt + Shift + S runs git status
bindkey '^[S' zle-git-status

# Alt + Shift + I runs tree directory
bindkey '^[I' zle-ls

# Alt + Shift + P runs page last command output
bindkey '^[P' zle-page-last-command-output

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

# Alt + Ctrl + K runs tree directory
bindkey '^[^K' zle-treed-depth-3

# Alt + Ctrl + I runs tree directory
bindkey '^[^I' zle-tree-depth-3

# Alt + I runs list directory
bindkey '^[i' zle-ls

# Alt + Shift + I runs tree directory
bindkey '^[I' zle-treed-depth-3

# Ctrl + Alt + Shift + L runs zsh login
bindkey '\e[1;8C' zle-zsh-login

# Ctrl + Alt + Shift + K runs tree depth 3
bindkey "\e[1;8A" zle-tree-depth-3

# Ctrl + K runs list directory
bindkey '^k' zle-ls

# Alt + Ctrl + K runs tree directory
bindkey '^[^K' zle-treed-depth-3

# Alt + Ctrl + I runs tree directory
bindkey '^[^I' zle-tree-depth-3

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

# Ctrl + U runs zsh-history-substring-search backwards
bindkey '^u' history-substring-search-up

# Ctrl + Alt + U runs zsh-history-substring-search forwards
bindkey '^[U' history-substring-search-down
