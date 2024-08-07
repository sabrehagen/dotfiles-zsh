# Set aws config path
export AWS_CONFIG_FILE=$HOME/.config/aws/config

# Set fzf path
export FZF_BASE=$HOME/.fzf/bin/fzf

# Set go path
export GOPATH=$HOME/go

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set less pager configuration
export LESS="--ignore-case --quit-if-one-screen --raw-control-chars"

# Add user binaries to path
export PATH=$HOME/.local/bin:$PATH

# Add go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add rust binaries to path
export PATH=$HOME/.cargo/bin:$PATH

# Add yarn binaries to path
export PATH=$HOME/.yarn/bin:$PATH

# Additional fzf bindings
export FZF_CTRL_R_OPTS="--bind=ctrl-j:accept"
export FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-30%}"

# Set ssh socket path
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Log pane output if running in tmux
if [ -n "$TMUX" ]; then
  mkdir -p $HOME/.tmux/logs
  tmux pipe-pane "cat | ansi2txt >> $HOME/.tmux/logs/tmux_session_#{session_name}_#{window_name}_$(date +%Y-%m-%d-%H-%M-%S).log" 2>/dev/null
fi

# Export private environment variables
source $HOME/.zshenv-private 2>/dev/null
