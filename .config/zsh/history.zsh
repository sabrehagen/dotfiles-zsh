# Set zsh history options
HISTFILE=$HOME/.cache/zsh/histfile
HISTSIZE=500000
SAVEHIST=500000

# Ensure history path exists
mkdir -p $(dirname $HISTFILE)
