# Ignore checking for multiple antigens running simultaneously
ANTIGEN_MUTEX=false

# Load antigen plugin manager
source antigen.zsh

# Use oh-my-zsh framework
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle fzf
antigen bundle git
antigen bundle gnu-utils
antigen bundle gpg-agent
antigen bundle ubuntu

# Bundles from third parties
antigen bundle buonomo/yarn-completion
antigen bundle lukechilds/zsh-nvm
antigen bundle paulirish/git-open
antigen bundle popstas/zsh-command-time
antigen bundle zdharma/zsh-diff-so-fancy
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
export PROMPT='
$fg[blue]%~ %{$fg[yellow]%}$(test -f $HOME/.ssh-private/id_rsa || echo 🔒\ )$(git_prompt_info)
%{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '

# Load wal colours
source ~/.cache/wal/colors.sh

# Reload wal for terminal
wal -Req 2>/dev/null

# Additional fzf bindings
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind=ctrl-j:accept"

# Additional zle bindings
bindkey -s '^[i' 'l^M'
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
alias b="git b"
alias bls="git bls"
alias aa="git aa"
alias ap="git ap"
alias bd="git bd"
alias c="git c"
alias ca="git ca"
alias cae="git cae"
alias caf="git caf"
alias cam="git cam"
alias camn="git camn"
alias camp="git camp"
alias campn="git campn"
alias cln="git cln"
alias cm="git cm"
alias co="git co"
alias cob="git cob"
alias coo="git coo"
alias cop="git cop"
alias cot="git cot"
alias copm="git copm"
alias d="git d"
alias db="git db"
alias dbl="git dbl"
alias dblame=~/.config/scripts/git-diff-blame.sh
alias ds="git ds"
alias f="git f"
alias he="git he"
alias ll=~/.config/scripts/git-fzf-log.sh
alias m="git m"
alias p="git p"
alias pp="git pp"
alias pu="git pu"
alias puf="git puf"
alias puu="git puu"
alias pun="git pun"
alias r="/opt/desktop-environment/run.sh"
alias rbm="git rbm"
alias s="git s"
alias st="git st"
alias sta="git sta"

# Alias common commands to better alternatives
alias ai="sudo apt-get install -y"
alias al="dpkg-query -L"
alias ar="sudo apt-get remove -y"
alias as="apt-file search --regexp"
alias ascii="figlet -f slant -m 2"
alias cat="bat --style plain --theme ansi-dark"
alias di="dpkg -i"
alias g="grep -iE"
alias get="git clone"
alias gets="git clone --depth 1 --single-branch --branch master"
alias gv="grep -ivE"
alias gottyc="gotty-client --v2"
alias h="~/.config/scripts/ssh-host-tty.sh"
alias ip="curl ip-api.com"
alias l="ls -lah --group-directories-first"
alias lastarg='echo $(last) | sed s/.*\ //'
alias last='echo $(fc -ln -1)'
alias mkx="chmod +x"
alias nm-imt="nmail -d ~/.config/nmail/imt"
alias nm-jd="nmail -d ~/.config/nmail/jd"
alias nm-len="nmail -d ~/.config/nmail/len"
alias nm-lib="nmail -d ~/.config/nmail/lib"
alias own="sudo chown -R $USER:$USER"
alias pastebin="curl -F 'f:1=<-' ix.io"
alias pdf="zathura"
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias rmf="rm -rf"
alias sa='sudo $(last)'
alias scripts="cat package.json | jq .scripts"
alias sc=scripts
alias su="sudo su"
alias sum="paste -sd+ - | bc"
alias t=tmux
alias tl='t ls'
alias tn='TMUX= t new-session -s on-demand-$(date +%s) -t'
alias ts="t display-message -p '#S'"
alias tk="t kill-session -t"
alias tree="tree -a -I 'node_modules|.git' -L 4"
alias u="..; ls -lht"
alias uu="...; ls -lht"
alias uuu="....; ls -lht"
alias v=vcsh
alias vd="vcsh foreach diff"
alias vs="vcsh status"
alias wifi="~/.config/scripts/ssh-host-tty.sh wicd-curses"
alias x="xargs -n 1 -I @"

login () {
  # Clone secrets if not already cloned
  if [ ! -f $HOME/.ssh-private/id_rsa ]; then
    source $HOME/.config/scripts/clone-secrets.sh
  fi
}

logout () {
  $HOME/.config/scripts/clean-secrets.sh
}

tm () {
  TARGET_GROUP="$@"
  TMUX_SESSION=$TARGET_GROUP-on-demand-$(date +%M%S)

  # Create a new tmux session in the target group
  tmux new-session \
    -d \
    -s $TMUX_SESSION \
    -t $TARGET_GROUP

  # Disable the new session status bar to avoid nested status bars
  tmux set-option -t $TMUX_SESSION status off

  # Attach to the new session
  TMUX= tmux attach-session -t $TMUX_SESSION
}

transfer () {
  curl -# -F "file=@$1" https://0x0.st
}

cpx () {
  cat $HISTFILE | tail -2 | head -1 | cut -c 16- | clipboard
}

function cd-redraw-prompt() {
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

function cd-rotate() {
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
