# Print mesasge of the day
echo
if echo $HOSTNAME | grep -q laptop; then
  ascii LAPTOP
elif echo $HOSTNAME | grep -q desktop; then
  ascii DESKTOP
elif echo $HOSTNAME | grep -q utm; then
  ascii ARM64
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
if [ "$PWD" = "$HOME" ] && [ -d ~/repositories ]; then
  cd ~/repositories
fi

# Log current working directory structure
tree -L 1 -d --noreport
