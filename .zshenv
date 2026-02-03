# Set hostname
export HOSTNAME=${HOSTNAME:-$(hostname)}

# Export xdg user config directory
export XDG_CONFIG_DIR=$HOME/.config

# Export xdg user runtime directory
export XDG_RUNTIME_DIR=$HOME/.local/run
mkdir -p -m u=rwx,go= $XDG_RUNTIME_DIR

# Export xdg user session type
export XDG_SESSION_TYPE=x11

# Set aws config path
export AWS_CONFIG_FILE=$HOME/.config/aws/config

# Set claude code config path
export CLAUDE_CONFIG_DIR=$HOME/.config/claude

# Make tree always output colour
export CLICOLOR_FORCE=1

# Set dbus session bus address
export DBUS_SESSION_BUS_ADDRESS=unix:path=$XDG_RUNTIME_DIR/dbus-session-bus

# Set fzf path
export FZF_BASE=$HOME/.fzf/bin/fzf

# Additional fzf bindings
export FZF_CTRL_R_OPTS='--bind=ctrl-j:accept'

# Set go path
export GOPATH=$HOME/go

# Set locale
export LC_ALL=en_US.UTF-8

# Set less pager configuration
export LESS='--ignore-case --no-init --quit-if-one-screen --RAW-CONTROL-CHARS'

# Add user binaries to path
export PATH=$HOME/.local/bin:$PATH

# Add go binaries to path
export PATH=$HOME/go/bin:$PATH

# Add rust binaries to path
export PATH=$HOME/.cargo/bin:$PATH

# Add yarn binaries to path
export PATH=$HOME/.yarn/bin:$PATH

# Use qt5ct for qt application theming
export QT_QPA_PLATFORMTHEME=qt5ct

# Export qt5ct library path
export LD_LIBRARY_PATH=/opt/qt5ct/src/qt5ct-common:$LD_LIBRARY_PATH

# Export zig version manager configuration
export ZVM_INSTALL=$HOME/.zvm/self
export PATH=$PATH:$HOME/.zvm/bin
export PATH=$PATH:$ZVM_INSTALL

# Set ssh socket path
export SSH_AUTH_SOCK=$HOME/.ssh/ssh-agent.sock

# Set tmux plugin manager path
export TMUX_PLUGIN_MANAGER_PATH=$HOME/.tmux/plugins

# Set timezone
export TZ=Australia/Sydney

# Set current user
export USER=$(whoami)

# Add user apt binaries to path if available
test -d $HOME/.apt && export PATH=$HOME/.apt/bin:$HOME/.apt/sbin:$HOME/.apt/usr/bin:$HOME/.apt/usr/sbin:$PATH

# Add user apt libraries to path if available
test -d $HOME/.apt && export LD_LIBRARY_PATH=$HOME/.apt/usr/lib:$HOME/.apt/usr/lib/x86_64-linux-gnu:$LD_LIBRARY_PATH

# Export private environment values
source $HOME/.zshenv-private 2>/dev/null
