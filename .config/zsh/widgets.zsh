# Function that evaluates the passed command and resets the prompt
zle-exec-inline() {
  echo
  eval "$@"
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

# Login shell widget that runs zsh --login
zle-zsh-login() {
  clear
  exec zsh --login </dev/tty
}
zle -N zle-zsh-login

# Source shell widget that realoads .zshrc and .zshenv
zle-source-shell() {
  eval source $HOME/.zshrc
  eval source $HOME/.zshenv

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
zle -N zle-source-shell

# Clear and exec widget that clears the terminal and executes the command
zle-clear-and-exec() {
  zle clear-screen
  zle accept-line
}
zle -N zle-clear-and-exec

# List directory widget that runs ls -l
zle-ls() {
  zle-exec-inline l
}
zle -N zle-ls

# Tree directory widget that runs tree
zle-tree() {
  zle-exec-inline tree
}
zle -N zle-tree

# Mode widget for running tree commands
zle-alt-shift-t-map() {
  treed-depth-2() {
    zle-exec-inline treed -L 2
  }
  zle -N treed-depth-2

  treed-depth-3() {
    zle-exec-inline treed -L 3
  }
  zle -N treed-depth-3

  treed-depth-4() {
    zle-exec-inline treed -L 4
  }
  zle -N treed-depth-4

  treed-depth-5() {
    zle-exec-inline treed -L 5
  }
  zle -N treed-depth-5

  treed-depth-6() {
    zle-exec-inline treed -L 6
  }
  zle -N treed-depth-6

  tree-depth-2() {
    zle-exec-inline tree -L 2
  }
  zle -N tree-depth-2

  tree-depth-3() {
    zle-exec-inline tree -L 3
  }
  zle -N tree-depth-3

  tree-depth-4() {
    zle-exec-inline tree -L 4
  }
  zle -N tree-depth-4

  tree-depth-5() {
    zle-exec-inline tree -L 5
  }
  zle -N tree-depth-5

  tree-depth-6() {
    zle-exec-inline tree -L 6
  }
  zle -N tree-depth-6

  local -A keys
  keys=(
    "d" "zle-treed"
    "D" "zle-tree"
    "2" "treed-depth-2"
    "3" "treed-depth-3"
    "4" "treed-depth-4"
    "5" "treed-depth-5"
    "6" "treed-depth-6"
    "@" "tree-depth-2"
    "#" "tree-depth-3"
    "$" "tree-depth-4"
    "%" "tree-depth-5"
    "^" "tree-depth-6"
  )

  read -k1 -t 3 key || return
  if (( ${+keys[$key]} )); then
    zle ${keys[$key]}
  fi
}
zle -N zle-alt-shift-t-map

cd-redraw-prompt() {
  {
    echoti civis
    local f
    # Run directory change hooks and prompt hooks
    for f in chpwd "${chpwd_functions[@]}" precmd "${precmd_functions[@]}"; do
      (( ! ${+functions[$f]} )) || "$f" &>/dev/null || true
    done
    zle reset-prompt
  } always {
    echoti cnorm
  }
}

cd-history-move() {
  emulate -L zsh
  while (( $#dirstack )) && ! pushd -q $1 &>/dev/null; do
    popd -q $1
  done
  cd-redraw-prompt
}

zle-cd-up() {
  cd -q ..
  cd-redraw-prompt
}
zle -N zle-cd-up

zle-cd-back() {
  cd-history-move +1
}
zle -N zle-cd-back

zle-cd-forward() {
  cd-history-move -0
}
zle -N zle-cd-forward
