# Set wal colours in shell environment
source $HOME/.cache/wal/colors.sh

# Send wal colour sequences to all terminals
cat $HOME/.cache/wal/sequences > /dev/pts/[0-9]*
