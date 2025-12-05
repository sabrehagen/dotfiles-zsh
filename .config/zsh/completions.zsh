# Load dra completions
eval "$(dra completion zsh 2>/dev/null)"

# Load npm completions
source <(npm completion 2>/dev/null)

# Completion for tn function (tmux new session)
_tn() {
  local -a sessions
  sessions=(${(f)"$(tmux list-sessions -F '#S' 2>/dev/null)"})
   _describe 'tmux sessions' sessions
}
compdef _tn tn
