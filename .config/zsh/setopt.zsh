# Disable zsh errors when no globs are matched
unsetopt nomatch

# Make cd push the old directory onto the directory stack
setopt auto_pushd

# Write the history file in the ":start:elapsed;command" format
setopt EXTENDED_HISTORY

# Expire duplicate entries first when trimming history
setopt HIST_EXPIRE_DUPS_FIRST

# Don't record an entry starting with a space
setopt HIST_IGNORE_SPACE

# Share history between all sessions
setopt SHARE_HISTORY

# Enable file locking to prevent history corruption
setopt HIST_FCNTL_LOCK

# Handle comments in interactive shell
setopt INTERACTIVE_COMMENTS
