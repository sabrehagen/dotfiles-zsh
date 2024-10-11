c() {
  sgpt --chat shell "$*"
}

cc() {
  sgpt --code "$*"
}

ch() {
  sgpt --show-chat shell
}

cx() {
  cxp | c
}

ccx() {
  cxp | cc
}

cxl() {
  cxp | wc -l
}

cxp() {
  find . -type f | gv '.git|.meltano|lock' | x zsh -c "echo file: @; cat @"
}

get() {
  git get $1
  REPO_NAME=$(basename $1 | sed s/.git$//)
  cd $REPO_NAME
}

infinite() {
  while true; do eval "$@"; done
}

load-env() {
  set -o allexport
  source "$@"
  set +o allexport
}

man() {
  LESS_TERMCAP_mb=$'\E[1;33m' \
  LESS_TERMCAP_md=$'\E[1;32m' \
  LESS_TERMCAP_me=$'\E[0m' \
  LESS_TERMCAP_se=$'\E[0m' \
  LESS_TERMCAP_so=$'\E[30;43m' \
  LESS_TERMCAP_ue=$'\E[0m' \
  LESS_TERMCAP_us=$'\E[1;31m' \
  command man "$@"
}

mk() {
  mkdir $1
  cd $1
}

mktmp() {
  TMP_DIR=/tmp/${1-$(date +%s)}
  mkdir $TMP_DIR
  cd $TMP_DIR
}

tn() {
  TMUX= tmux new-session -s on-demand-$(date +%s) -t "$@"
}

transfer() {
  curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null
}
