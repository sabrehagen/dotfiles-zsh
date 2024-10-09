# Set current user
export USER=$(whoami)

# Load jump functions
eval "$(jump shell zsh 2>/dev/null)"

# Load nvm functions
source /opt/nvm/nvm.sh 2>/dev/null
