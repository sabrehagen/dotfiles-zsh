# Ignore checking for multiple antigens running simultaneously
ANTIGEN_MUTEX=false
ANTIGEN_LOG=/tmp/antigen

# Load flux completions
command -v flux >/dev/null && . <(flux completion zsh) && compdef _flux flux

# Load helm completions
command -v helm >/dev/null && . <(helm completion zsh 2>/dev/null) && compdef _flux flux

# Load antigen plugin manager
source antigen.zsh

# Use oh-my-zsh framework
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle command-not-found
antigen bundle fzf
antigen bundle git
antigen bundle gnu-utils
antigen bundle gpg-agent
antigen bundle ubuntu

# Bundles from third parties
antigen bundle buonomo/yarn-extra-completion@main
antigen bundle paulirish/git-open
antigen bundle popstas/zsh-command-time
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme
antigen theme avit

# Apply antigen plugins
antigen apply

# Disable zsh errors when no globs are matched
unsetopt nomatch

# Do not remove spaces when piping commands
ZLE_REMOVE_SUFFIX_CHARS=

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set the shell prompt
PROMPT='
$fg[blue]%~ %{$fg[yellow]%}$(git_prompt_info)
%{%(?.$fg[$CARETCOLOR].$fg[red])%}λ%{$reset_color%} '

# Set the shell right prompt
RPROMPT+='%(?..%{$fg_bold[red]%}%?%{$reset_color%}'

# Load wal colours
source $HOME/.cache/wal/colors.sh

# Reload wal for terminal
wal -Req 2>/dev/null

# Additional zle bindings
bindkey -s '^[i' 'l^M'
bindkey -s '^[t' 'tree^M'
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

# Load jump shell
eval "$(jump shell zsh)"

# Alias git commands
alias a="git a"
alias aa="git aa"
alias ap="git ap"
alias b="git b"
alias bd="git bd"
alias bls="git bls"
alias bmv="git bmv"
alias bu="git bu"
alias c="git c"
alias ca="git ca"
alias caa="git caa"
alias cae="git cae"
alias caf="git caf"
alias caaf="git caaf"
alias cam="git cam"
alias camn="git camn"
alias camp="git camp"
alias campn="git campn"
alias cep="git cep"
alias cln="git cln"
alias cm="git cm"
alias cmp="git cmp"
alias co="git co"
alias cob="git cob"
alias coo="git coo"
alias coop="git coop"
alias cop="git cop"
alias copd="git copd"
alias copm="git copm"
alias cot="git cot"
alias d="git d"
alias db="git db"
alias dc="git dc"
alias dbl="git dbl"
alias dblame=$HOME/.config/scripts/git-diff-blame.sh
alias ds="git ds"
alias f="git f"
alias gr="git replace"
alias ll=$HOME/.config/scripts/git-fzf-log.sh
alias lll="git lll"
alias m="git m"
alias ma="git ma"
alias p="git p"
alias pp="git pp"
alias psp="git pst"
alias psu="git psu"
alias pu="git pu"
alias puf="git puf"
alias puu="git puu"
alias pun="git pun"
alias r="git r"
alias rp="git rp"
alias rr="git rr"
alias rb="git rb"
alias rba="git rba"
alias rbc="git rbc"
alias rbd="git rbd"
alias rbm="git rbm"
alias rbo="git rbo"
alias rbos="git rbos"
alias s="git s"
alias sf="git sf"
alias sa="git sa"
alias sh="git sh"
alias sl="git sl"
alias sp="git sp"
alias ss="git ss"
alias st="git st"

# Alias common commands to better alternatives
alias ah="apt show"
alias ai="sudo apt-get install -y"
alias al="dpkg-query -L"
alias ar="sudo apt-get remove -y"
alias as="apt-file search --regexp"
alias au="sudo apt-get update"
alias ax="arc unarchive"
alias ascii="figlet -f slant -m 2"
alias bt=bluetuith
alias btp=$HOME/.config/scripts/host-pulseaudio.sh
alias cat="bat --style plain --theme ansi"
alias di="sudo dpkg -i"
alias dl="dpkg -c"
alias feh="feh --image-bg black --keep-zoom-vp"
alias g="grep -iE"
alias gets="git clone --depth 1 --single-branch --branch master"
alias gv="grep -ivE"
alias gottyc="gotty-client --v2"
alias h=$HOME/.config/scripts/host-ssh-tty.sh
alias ha=$HOME/.config/scripts/arm64-ssh.sh
alias hn=$HOME/.config/scripts/host-network.sh
alias ip="curl ip-api.com"
alias l="exa -la --group-directories-first"
alias lastarg='echo $(last) | sed s/.*\ //'
alias last='echo $(fc -ln -1)'
alias ls=exa
alias mkx="chmod +x"
alias own="sudo chown -R $USER:$USER"
alias pastebin="curl -F 'f:1=<-' ix.io"
alias pb=pastebin
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias rmf="rm -rf"
alias scripts="cat package.json | jq .scripts"
alias sc=scripts
alias sum="paste -sd+ - | bc"
alias swallow="$HOME/.config/i3/run-and-swallow.py"
alias t=tmux
alias tl='t ls'
alias tk="t kill-session -t"
alias tn='TMUX= t new-session -s on-demand-$(date +%s) -t'
alias ts="t choose-session"
alias tree="tree -a -I 'node_modules|.git' -L 4"
alias u="..; ls -lht"
alias uu="...; ls -lht"
alias uuu="....; ls -lht"
alias v=vcsh
alias vd="vcsh foreach diff"
alias vs="vcsh status --terse"
alias vl="vcsh list"
alias wifi="$HOME/.config/scripts/ssh-host-tty.sh wicd-curses"
alias x="xargs -I @"
alias zs="source ~/.zshrc"
alias zl="clear; zsh --login"

isLoggedIn () {
  LOGGED_IN_FILE=$HOME/.ssh-private/id_rsa

  # Exit with error if not logged in
  if [ ! -f $LOGGED_IN_FILE ]; then
    echo Not logged in! No datastore available.
    exit 1
  fi
}

login () {
  # Clone secrets if not already cloned
  if [ ! -f $HOME/.ssh-private/id_rsa ]; then
    source $HOME/.config/scripts/clone-secrets.sh
  fi
}

logout () {
  $HOME/.config/scripts/clean-secrets.sh
}

cpx () {
  cat $HISTFILE | tail -2 | head -1 | cut -c 16- | head -c -1 | clipboard
}

get () {
  git get $1
  REPO_NAME=$(basename $1 | sed s/.git$//)
  cd $REPO_NAME
}

mk () {
  mkdir $1
  cd $1
}

mktmp () {
  TMP_DIR=/tmp/${1-$(date +%s)}
  mkdir $TMP_DIR
  cd $TMP_DIR
}

pbg () {
  curl --silent ix.io/$1
}

pbc () {
  pbg $1 | clipboard
}

pbx () {
  $(pbg $1)
}

upload () {
  curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
}

function cd-redraw-prompt () {
  {
    builtin echoti civis
    builtin local f
    for f in chpwd "${chpwd_functions[@]}" precmd "${precmd_functions[@]}"; do
      (( ! ${+functions[$f]} )) || "$f" &>/dev/null || builtin true
    done
    builtin zle reset-prompt
  } always {
    builtin echoti cnorm
  }
}

function cd-rotate () {
  () {
    builtin emulate -L zsh
    while (( $#dirstack )) && ! builtin pushd -q $1 &>/dev/null; do
      builtin popd -q $1
    done
    (( $#dirstack ))
  } "$@" && cd-redraw-prompt
}

function cd-up() { builtin cd -q .. && cd-redraw-prompt; }
function cd-back() { cd-rotate +1; }
function cd-forward() { cd-rotate -0; }

builtin zle -N cd-up
builtin zle -N cd-back
builtin zle -N cd-forward

() {
  builtin local keymap
  for keymap in emacs viins vicmd; do
    builtin bindkey '^[u' cd-up
    builtin bindkey '^[-' cd-back
    builtin bindkey '^[_' cd-forward
  done
}

setopt auto_pushd
