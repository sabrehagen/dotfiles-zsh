# Load base container .zshenv
source $HOME/.zshenv.base

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"

# Load secrets into environment if present
test -f ~/.secrets.conf &&
  export $(sh ~/.secrets.conf)
