# Load development environment ssh keys if present
if [ -d /stemn/credentials ]; then
  ssh-add /stemn/credentials/development-environment.prv >/dev/null 2>&1
fi

# Set git user configuration from environment variables
if [ ! -z "$STEMN_GIT_EMAIL" ]; then
  git config --global user.email "$STEMN_GIT_EMAIL"
fi
if [ ! -z "$STEMN_GIT_NAME" ]; then
  git config --global user.name "$STEMN_GIT_NAME"
fi

# Print mesasge of the day
echo
if echo $HOSTNAME | grep -q laptop; then
  ascii LAPTOP
elif echo $HOSTNAME | grep -q desktop; then
  ascii DESKTOP
else
  ascii CLOUD
fi
echo

# Print container build info if present
if [ ! -z "$CONTAINER_BUILD_DATE" ]; then
  GREEN=$(tput setaf 2)
  MAGENTA=$(tput setaf 5)
  WHITE=$(tput setaf 7)
  YELLOW=$(tput setaf 3)

  CURRENT_DATE=$(date +%s)
  TIME_SINCE_CONTAINER_BUILD=$(echo $((CURRENT_DATE-CONTAINER_BUILD_DATE)) | awk '{print int($1/(60*60*24))" days "int(($1/(60*60)%24))" hrs "int($1/60%60)" mins "int($1%60)" secs ago"}')

  COLOURED_TIME_SINCE_CONTAINER_BUILD=$(echo $TIME_SINCE_CONTAINER_BUILD | sed -E "s;([0-9]+);$GREEN\1$WHITE;g")
  COLOURED_CONTAINER_GIT_SHA="$YELLOW${CONTAINER_GIT_SHA}$WHITE"
  COLOURED_CONTAINER_IMAGE_NAME="$MAGENTA${CONTAINER_IMAGE_NAME}$WHITE"

  echo "$COLOURED_CONTAINER_IMAGE_NAME | built $COLOURED_TIME_SINCE_CONTAINER_BUILD | $COLOURED_CONTAINER_GIT_SHA"
fi

# Log current working directory structure
tree -L 1 -d

# Unlock ssh private key
eval `keychain --eval $HOME/.ssh-private/id_rsa 2>/dev/null`

# Clone secrets if not already cloned
if [ ! -f ~/.ssh-private/id_rsa ]; then
  . ~/.config/scripts/clone-secrets.sh
fi

# Start desktop services if not alredy started
EXISTING_LOGIN_SESSION=$(tmux ls | egrep "^desktop-environment-shell:" | grep -v grep)
if [ -z $EXISTING_LOGIN_SESSION ]; then
  ~/.config/scripts/startup.sh
fi
