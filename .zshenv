# Add user binaries to path
export PATH=$HOME/.bin:$PATH

# Add yarn binaries to path
export PATH=$HOME/.yarn/bin:$PATH

# Set fzf install directory
export FZF_BASE=/opt/fzf

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set nvm install directory
export NVM_DIR=/opt/nvm

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"
alias polo="nohup polo-gtk >/dev/null 2>&1 &"
alias slack="nohup slack >/dev/null 2>&1 &; disown %1"
