# Function that evaluates the passed command and resets the prompt
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

# Function that evaluates the passed command silently and clears the prompt
zle-silent-execute() {
  eval "$BUFFER" >/dev/null 2>&1
  zle backward-kill-line
}
zle -N zle-silent-execute

# Function to load last command output into the line buffer
zle-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N zle-last-command-output

# Clear and exec widget that clears the terminal and executes the command
zle-clear-and-exec() {
  zle clear-screen
  zle accept-line
}
zle -N zle-clear-and-exec
