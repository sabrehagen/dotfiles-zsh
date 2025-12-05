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

# List directory widget that runs ls -l
zle-ls() {
  zle-exec-inline l
}
zle -N zle-ls
