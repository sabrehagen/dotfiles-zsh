# Add user binaries to path
export PATH=$HOME/.bin:$PATH

# Configure antigen
export ADOTDIR=/opt/antigen

# Set fzf install directory
export FZF_BASE=/opt/fzf

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set fzf install directory
export NVM_DIR=/opt/nvm

# Configure tmux plugin manager
export TMUX_PLUGIN_MANAGER_PATH=/opt/tpm/plugins

# Load secrets into environment if present
if [ -d $HOME/.secrets ]; then
  . $HOME/.secrets/*
fi

# Alias remote connections to include webrelay environment secrets
alias ssh-desktop="nohup google-chrome --app=$RELAY_HOST_DESKTOP >/dev/null 2>&1 &; disown %1"
alias ssh-laptop="nohup google-chrome --app=$RELAY_HOST_LAPTOP >/dev/null 2>&1 &; disown %1"

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"
