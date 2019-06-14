# Add user binaries to path
export PATH=$HOME/.bin:$PATH

# Configure antigen
export ADOTDIR=/opt/antigen

# Set fzf install directory
export FZF_BASE=/opt/fzf

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set nvm install directory
export NVM_DIR=/opt/nvm

# Configure tmux plugin manager
export TMUX_PLUGIN_MANAGER_PATH=/opt/tpm/plugins

# Load secrets into environment if present
SECRETS=$HOME/.secrets
if [ -d $SECRETS ]; then
  for SECRET in $(ls $SECRETS); do
    . $SECRETS/$SECRET
  done
fi

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"
alias slack="nohup slack >/dev/null 2>&1 &; disown %1"
