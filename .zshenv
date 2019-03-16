# Configure antigen
export ADOTDIR=/opt/antigen

# Add user binaries to path
export PATH=$HOME/.bin:$PATH

# Add fzf to path
export PATH=$PATH:/opt/fzf/bin

# Configure tmux plugin manager
export TMUX_PLUGIN_MANAGER_PATH=/opt/tpm/plugins

# Load secrets into environment if present
if [ -d ~/.secrets ] && [ "$(ls ~/.secrets | wc -l)" -gt 0 ]; then
  export $(cat ~/.secrets/*)
fi

# Alias remote connections to include webrelay environment secrets
alias ssh-desktop="nohup google-chrome --app=$RELAY_HOST_DESKTOP >/dev/null 2>&1 &; disown %1"
alias ssh-laptop="nohup google-chrome --app=$RELAY_HOST_LAPTOP >/dev/null 2>&1 &; disown %1"

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"

# Custom shell functions
function https-to-git () { sed -i 's;https://.*github.com/\(.*\);git@github.com:\1;' "${1:-.git/config}"; }
