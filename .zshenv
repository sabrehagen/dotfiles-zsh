# Set aws config path
export AWS_CONFIG_FILE=$HOME/.config/aws/config

# Make tree always output colour
export CLICOLOR_FORCE=1

# Set fzf path
export FZF_BASE=$HOME/.fzf/bin/fzf

# Set go path
export GOPATH=$HOME/go

# Set less pager configuration
export LESS='--ignore-case --quit-if-one-screen --raw-control-chars'

# Add user binaries to path
export PATH=$HOME/.local/bin:$PATH

# Add go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add rust binaries to path
export PATH=$HOME/.cargo/bin:$PATH

# Add yarn binaries to path
export PATH=$HOME/.yarn/bin:$PATH

# Additional fzf bindings
export FZF_CTRL_R_OPTS='--bind=ctrl-j:accept'

# Set ssh socket path
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Export private environment values
source $HOME/.zshenv-private 2>/dev/null
