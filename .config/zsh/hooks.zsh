# Function that runs tmux-window-name in the background
tmux-window-name() {
  ($TMUX_PLUGIN_MANAGER_PATH/tmux-window-name/scripts/rename_session_windows.py &>/dev/null &)
}
add-zsh-hook chpwd tmux-window-name
add-zsh-hook precmd tmux-window-name
add-zsh-hook preexec tmux-window-name
