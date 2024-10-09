# Set wal colours in shell environment
source $HOME/.cache/wal/colors.sh 2>/dev/null

# Send wal colour sequences to all terminals
cat $HOME/.cache/wal/sequences 2>/dev/null > /dev/pts/[0-9]*
