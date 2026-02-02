# Login shell widget that runs zsh --login
zle-zsh-login() {
  clear
  exec zsh --login </dev/tty
}
zle -N zle-zsh-login

zle-zsh-source-zshenv() {
  eval source $HOME/.zshenv
}

zle-zsh-source-zshrc() {
  eval source $HOME/.zshrc
  zle-zsh-source-zshenv
}

# Reload shell widget that reloads .zshrc and .zshenv
zle-zsh-reload-shell() {
  zle-zsh-source-zshrc

  # Update prompt to indicate shell config sourced successfully
  ORIGINAL_PROMPT=$PROMPT
  PROMPT="$(echo $PROMPT | sed s/λ/$fg[green]λ%{$reset_color%}/)"
  zle reset-prompt

  reset-prompt() {
    PROMPT=$ORIGINAL_PROMPT
    zle reset-prompt
  }
  RESET_PROMPT_SIGNAL=USR1
  trap reset-prompt $RESET_PROMPT_SIGNAL

  # Send signal to reset prompt after one second in the background so control is returned to zle
  (
    sleep 1
    kill -$RESET_PROMPT_SIGNAL $$
  ) &!
}
zle -N zle-zsh-reload-shell

# Clear and exec widget that clears the terminal and executes the command
zle-clear-and-exec() {
  zle clear-screen
  zle accept-line
}
zle -N zle-clear-and-exec
