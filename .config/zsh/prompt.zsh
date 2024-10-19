# Set the prompt
PROMPT='
$fg[blue]%~ %{$fg[yellow]%}$(test -f $HOME/.ssh-private/id_rsa || echo 🔒\ )$(git_prompt_info)
%{%(?.$fg[$CARETCOLOR].$fg[red])%}λ%{$reset_color%} '

# Set the right prompt
RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}%(?..%{$fg_bold[red]%}%?%{$reset_color%})${_return_status}%{$(echotc DO 1)%}'

# Do not print no-newline indicator if the command output doesn't have a trailing newline
PROMPT_EOL_MARK=
