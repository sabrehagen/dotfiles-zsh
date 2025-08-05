# Set hostname
export HOSTNAME=${HOSTNAME:-$(hostname)}

# Set aws config path
export AWS_CONFIG_FILE=$HOME/.config/aws/config

# Set claude code config path
export CLAUDE_CONFIG_DIR=$HOME/.config/claude

# Make tree always output colour
export CLICOLOR_FORCE=1

# Set fzf path
export FZF_BASE=$HOME/.fzf/bin/fzf

# Additional fzf bindings
export FZF_CTRL_R_OPTS='--bind=ctrl-j:accept'

# Set go path
export GOPATH=$HOME/go

# Set locale
export LC_ALL=en_US.UTF-8

# Add user apt libraries to path
export LD_LIBRARY_PATH=$HOME/.apt/usr/lib:$HOME/.apt/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

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

# Add user apt binaries to path
export PATH=$HOME/.apt/bin:$HOME/.apt/sbin:$HOME/.apt/usr/bin:$HOME/.apt/usr/sbin:$PATH

# Set ssh socket path
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Set timezone
export TZ=Australia/Sydney

# Set current user
export USER=$(whoami)

# Export private environment values
source $HOME/.zshenv-private 2>/dev/null
