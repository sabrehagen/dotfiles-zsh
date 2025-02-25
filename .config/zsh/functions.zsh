c() {
  sgpt --chat shell "$*"
}

cc() {
  sgpt --code "Produce a posix compatible shell command or shell script to do the following, unless specified otherwise: $*"
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
  find . -type f | gv '.git|.meltano|lock' | x zsh -c 'echo file: @; cat @'
}

ascii() {
  APT_GET_USERSPACE_FIGLET=$HOME/.apt/usr/share/figlet
  if [ -d $APT_GET_USERSPACE_FIGLET ]; then
    figlet -d $APT_GET_USERSPACE_FIGLET "$@"
  else
    figlet "$@"
  fi
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

  for ENV_VAR in $(grep -o '^[a-zA-Z0-9_]+=' "$@" | sed -E 's/([^=]*)=.*/\1/'); do
    if [ -z "$(eval echo \$$ENV_VAR)" ]; then
      echo "Environment variable $ENV_VAR is not set"
    fi
  done
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

pastebin() {
  if (( $# )); then
    local file
    for file; do
      curl --silent --data-binary @"$file" --header "X-FileName: ${file##*/}" https://paste.c-net.org
    done
  else
    curl --silent --data-binary @- https://paste.c-net.org
  fi
}

pasteget() {
  local arg
  if (( $# )); then
    for arg; do
      curl --silent https://paste.c-net.org/${arg##*/}
    done
  else
    while read -r arg; do
      curl --silent https://paste.c-net.org/${arg##*/}
    done
  fi
}

tn() {
  TMUX= tmux new-session -s on-demand-$(date +%s) -t "$@"
}
