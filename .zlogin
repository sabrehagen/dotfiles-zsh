# Print mesasge of the day
echo
if [ -d /mnt/host ]; then
  ascii arm64
elif echo $HOSTNAME | grep -q laptop; then
  ascii LAPTOP
elif echo $HOSTNAME | grep -q desktop; then
  ascii DESKTOP
elif echo $HOSTNAME | grep -q linux; then
  ascii x86
else
  ascii CLOUD
fi

# Print container build info if present
if [ ! -z "$DESKTOP_ENVIRONMENT_CONTAINER_BUILD_DATE" ]; then
  GREEN=$(tput setaf 2)
  MAGENTA=$(tput setaf 5)
  WHITE=$(tput setaf 7)
  YELLOW=$(tput setaf 3)

  CURRENT_DATE=$(date +%s)
  TIME_SINCE_CONTAINER_BUILD=$(echo $((CURRENT_DATE-DESKTOP_ENVIRONMENT_CONTAINER_BUILD_DATE)) | awk '{print int($1/(60*60*24))" days "int(($1/(60*60)%24))" hrs "int($1/60%60)" mins "int($1%60)" secs ago"}')

  COLOURED_TIME_SINCE_CONTAINER_BUILD=$(echo $TIME_SINCE_CONTAINER_BUILD | sed -E "s;([0-9]+);$GREEN\1$WHITE;g")
  COLOURED_CONTAINER_GIT_SHA="$YELLOW${DESKTOP_ENVIRONMENT_CONTAINER_GIT_SHA}$WHITE"
  COLOURED_CONTAINER_IMAGE_NAME="$MAGENTA${DESKTOP_ENVIRONMENT_CONTAINER_IMAGE_NAME}$WHITE"

  echo "$COLOURED_CONTAINER_IMAGE_NAME | built $COLOURED_TIME_SINCE_CONTAINER_BUILD | $COLOURED_CONTAINER_GIT_SHA"
fi

# Set the default directory to the repositories folder
if [ "$PWD" = "$HOME" ] && [ -d $HOME/repositories ]; then
  cd $HOME/repositories
fi

# Log current working directory structure
tree -L 1 -d --noreport

# Common tmux session for all ssh connections
TMUX_SSH_SESSION=ssh-client

# Ensure tmux ssh session exists for ssh clients to join on connection
tmux has-session -t $TMUX_SSH_SESSION 2>/dev/null || tmux new-session -A -s $TMUX_SSH_SESSION zsh --login

# Start tmux on ssh login
if [[ -z $TMUX ]] && [[ -n $SSH_TTY ]]; then
  exec tmux new-session -A -s $TMUX_SSH_SESSION -t $TMUX_SSH_SESSION
fi
