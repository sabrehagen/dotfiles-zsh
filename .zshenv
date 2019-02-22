# Load secrets into environment if present
test -f ~/.secrets.conf &&
  export $(cat ~/.secrets.conf)

# Alias remote connections to include webrelay environment secrets
alias ssh-desktop="nohup google-chrome --app=$RELAY_HOST_DESKTOP >/dev/null 2>&1 &; disown %1"
alias ssh-laptop="nohup google-chrome --app=$RELAY_HOST_LAPTOP >/dev/null 2>&1 &; disown %1"

# Alias common commands to better alternatives
alias chrome="nohup google-chrome >/dev/null 2>&1 &; disown %1"
