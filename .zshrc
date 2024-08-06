# Load zgenom plugin manager
source "${HOME}/.zgenom/zgenom.zsh"

# If no zgenom static init exists
if ! zgenom saved; then

  # Use oh-my-zsh framework
  zgenom oh-my-zsh

  # Bundles from oh-my-zsh
  zgenom oh-my-zsh plugins/command-not-found
  zgenom oh-my-zsh plugins/fzf
  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/gnu-utils

  # Bundles from third parties
  zgenom load grigorii-zander/zsh-npm-scripts-autocomplete
  zgenom load paulirish/git-open
  zgenom load popstas/zsh-command-time
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-history-substring-search
  zgenom load zsh-users/zsh-syntax-highlighting

  # Load the theme
  zgenom oh-my-zsh themes/avit

  # Generate zgenom static init
  zgenom save
fi

# Set the shell prompt
PROMPT='
$fg[blue]%~ %{$fg[yellow]%}$(test -f $HOME/.ssh-private/id_rsa || echo 🔒\ )$(git_prompt_info)
%{%(?.$fg[$CARETCOLOR].$fg[red])%}λ%{$reset_color%} '

# Set the shell right prompt
RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}%(?..%{$fg_bold[red]%}%?%{$reset_color%})${_return_status}%{$(echotc DO 1)%}'

# Disable zsh errors when no globs are matched
unsetopt nomatch

# Do not remove spaces when piping commands
ZLE_REMOVE_SUFFIX_CHARS=

# Handle comments in interactive shell
setopt INTERACTIVE_COMMENTS

# Load jump shell
eval "$(jump shell zsh)"

# Load nvm
source /opt/nvm/nvm.sh

# Load wal colours
source $HOME/.cache/wal/colors.sh

# Reload wal for terminal (run in subshell as wal can hang when pty is non-responsive)
(wal -Reqn 2>/dev/null &)

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

# Alias git commands
alias a="git a"
alias aa="git aa"
alias aad="git aad"
alias ap="git ap"
alias app="git app"
alias apr="git apr"
alias b="git b"
alias bd="git bd"
alias bls="git bls"
alias bmv="git bmv"
alias bu="git bu"
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
alias chp="git chp"
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
alias dd="git dd"
alias dbl="git dbl"
alias dbp="git dbp"
alias dblame=$HOME/.config/scripts/git-diff-blame.sh
alias ds="git ds"
alias f="git f"
alias gs="git subst"
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
alias ra="git ra"
alias rb="git rb"
alias rba="git rba"
alias rbc="git rbc"
alias rbd="git rbd"
alias rbm="git rbm"
alias rbo="git rbo"
alias rbos="git rbos"
alias revert="git revert"
alias rh="git rh"
alias rp="git rp"
alias rr="git rr"
alias s="git s"
alias sf="git sf"
alias sa="git sa"
alias sh="git sh"
alias shl="git shl"
alias show="git show"
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
alias cat="batcat --style plain --theme ansi"
alias di="sudo dpkg -i"
alias dl="dpkg -c"
alias feh="feh --image-bg black --keep-zoom-vp"
alias g="grep --color=always --extended-regexp --ignore-case"
alias gets="git clone --depth 1 --single-branch --branch master"
alias ghp="GH_CONFIG_DIR=$HOME/.config/gh-personal gh"
alias gl="g --files-with-matches"
alias gr="g --recursive"
alias grl="gr --files-with-matches"
alias gv="g --invert-match"
alias gottyc="gotty-client --v2"
alias h=$HOME/.config/scripts/host-ssh-tty.sh
alias ha=$HOME/.config/scripts/arm64-ssh.sh
alias hn=$HOME/.config/scripts/host-network.sh
alias ip="curl ip-api.com"
alias jqc="jq -C"
alias jql="jqc | less"
alias l="EZA_GRID_ROWS=50 eza --all --grid --group-directories-first --long --no-permissions --octal-permissions --smart-group"
alias la="l --absolute"
alias ld="lh --only-dirs"
alias lf="lh --only-files"
alias lh="l --total-size"
alias ls=eza
alias lt="l --sort=modified"
alias mkx="chmod +x"
alias own="sudo chown -R $USER:$USER"
alias pastebin="curl -F 'f:1=<-' ix.io"
alias pb=pastebin
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias rmf="rm -rf"
alias scripts="cat package.json | jq .scripts"
alias sc=scripts
alias strip=ansi2txt
alias sum="paste -sd+ - | bc"
alias swallow="$HOME/.config/i3/run-and-swallow.py"
alias t=tmux
alias tl="t ls"
alias tk="t kill-session -t"
alias tn="TMUX= t new-session -s on-demand-$(date +%s) -t"
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
alias zs="source $HOME/.zshrc; source $HOME/.zshenv"
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

c () {
  sgpt --chat shell "$*"
}

cc () {
  sgpt --code "$*"
}

ch () {
  sgpt --show-chat shell
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

transfer () {
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

# Set zsh history options
HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=500000
SAVEHIST=500000
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry
setopt SHARE_HISTORY             # Share history between all sessions

# Ensure path to history file exists
mkdir -p $(dirname $HISTFILE)
