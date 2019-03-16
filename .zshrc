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
antigen bundle helm
antigen bundle kubectl
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

# Highlight the development environment icon in the shell prompt if we're on a remote machine
export STEMN_ZSH_ENVIRONMENT_ICON_CHAR=⛀
export STEMN_ZSH_ENVIRONMENT_ICON_COLOUR=white
if [ ! -z "$TERRAFORM_TARGET" ] && [ "$TERRAFORM_TARGET" != "localhost" ]; then
  export STEMN_ZSH_ENVIRONMENT_ICON_CHAR=⛃
  export STEMN_ZSH_ENVIRONMENT_ICON_COLOUR=magenta
fi

# Set the shell prompt
export PROMPT='
${_current_dir}%{$fg[$STEMN_ZSH_ENVIRONMENT_ICON_COLOUR]%}$STEMN_ZSH_ENVIRONMENT_ICON_CHAR $(git_prompt_info)
%{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '

# Alias common commands to better alternatives
alias c=cat
alias cat=bat
alias d="git d"
alias g=grep
alias gg=lazygit
alias imgur=imgur-uploader
alias pastebin="curl -F 'f:1=<-' ix.io"
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias s="git s"
alias scripts="cat package.json | jq .scripts"
alias tn="tmux new-session -s on-demand-$(date +%s) -t"
alias tree="tree -a -I 'node_modules|.git' -L 4"
alias u=".."
alias uu="..."
alias uuu="...."
alias vcshp="VCSH_REPO_D=$HOME/.config/vcsh/repo-private.d vcsh"
alias x='xargs -n 1 -I %'
