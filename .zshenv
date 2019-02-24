# Load secrets into environment if present
if [ -d ~/.secrets ] && [ "$(ls ~/.secrets | wc -l)" -gt 0 ]; then
  export $(cat ~/.secrets/*)
fi

# Set user environment
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Alias remote connections to include webrelay environment secrets
alias ssh-desktop="nohup google-chrome --app=$RELAY_HOST_DESKTOP >/dev/null 2>&1 &; disown %1"
alias ssh-laptop="nohup google-chrome --app=$RELAY_HOST_LAPTOP >/dev/null 2>&1 &; disown %1"

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"

# Alias common commands to better alternatives
alias cat=bat
alias g=grep
alias imgur=imgur-uploader
alias pastebin="curl -F 'f:1=<-' ix.io"
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias tmux="tmux -S $HOME/.tmux.sock"
alias tree="tree -a -I 'node_modules|.git' -L 4"

# Custom shell functions
export function https-to-git () { sed -i 's;https://.*github.com/\(.*\);git@github.com:\1;' "${1:-.git/config}"; }

