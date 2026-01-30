# Evaluate the passed command and reset the prompt
zle-exec-inline() {
  # Ensure precmd hooks are run before executing the command inline
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done

  # Evaluate the command inline and reproduce normal output spacing (force TTY redirection, needed by eza)
  echo
  eval "$@" >/dev/tty </dev/tty
  echo
  echo
  zle reset-prompt
}

# Evaluate the passed command silently and clear the prompt
zle-silent-execute() {
  eval "$BUFFER" >/dev/null 2>&1
  zle backward-kill-line
}
zle -N zle-silent-execute

# Load the last command output into the zle buffer
zle-buffer-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N zle-buffer-last-command-output

# Execute the current buffer and replace it with the execution output
zle-exec-and-replace-buffer() {
  BUFFER="$(eval "$BUFFER" 2>&1)"
  CURSOR=${#BUFFER}
}
zle -N zle-exec-and-replace-buffer

# Load the last command output into the pager
zle-page-last-command-output() {
  zle-exec-inline "eval $history[$((HISTCMD-1))] | cat"
  zle reset-prompt
}
zle -N zle-page-last-command-output

# Clear the terminal and execute the zle buffer
zle-clear-and-exec() {
  zle clear-screen
  zle accept-line
}
zle -N zle-clear-and-exec

# Disable syntax highlighting before paste and restore on completion (prevents slow paste)
_paste_and_refresh() {
  zle .bracketed-paste
  zle .backward-char && zle .forward-char
  (( $+functions[_zsh_highlight] )) && _zsh_highlight && zle .redisplay
}
zle -N bracketed-paste _paste_and_refresh
