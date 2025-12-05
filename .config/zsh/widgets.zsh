# Function that evaluates the passed command and resets the prompt
zle-exec-inline() {
  # Ensure precmd hooks are run before executing the command inline
  local precmd
  for precmd in $precmd_functions; do
    $precmd
  done

  # Evaluate the command inline and reproduce normal output spacing
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

# Function to load last command output into the line buffer
zle-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N zle-last-command-output

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

# List directory widget that runs ls -l
zle-ls() {
  zle-exec-inline l
}
zle -N zle-ls

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
