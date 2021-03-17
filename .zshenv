# Set fzf path
export FZF_BASE=$HOME/.local/bin/fzf

# Set go path
export GOPATH=$HOME/go

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Add user binaries to path
export PATH=$HOME/.local/bin:$PATH

# Add go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add rust binaries to path
export PATH=$HOME/.cargo/bin:$PATH

# Add yarn binaries to path
export PATH=$HOME/.yarn/bin:$PATH

# Set ssh socket path
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins
