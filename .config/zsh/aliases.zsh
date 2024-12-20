# Alias git commands
alias a="git a"
alias aa="git aa"
alias aad="git aad"
alias aal="git aal"
alias ap="git ap"
alias app="git app"
alias apr="git apr"
alias b="git b"
alias bls="git bls"
alias bmv="git bmv"
alias br="git br"
alias brm="git brm"
alias bu="git bu"
alias ca="git ca"
alias caa="git caa"
alias cae="git cae"
alias caf="git caf"
alias caaf="git caaf"
alias cam="git cam"
alias camn="git camn"
alias camp="git camp"
alias campn="git campn"
alias cep="git cep"
alias chp="git chp"
alias cln="git cln"
alias cm="git cm"
alias cmp="git cmp"
alias co="git co"
alias cob="git cob"
alias cod="git cod"
alias com="git com"
alias coo="git coo"
alias coop="git coop"
alias cop="git cop"
alias copd="git copd"
alias copm="git copm"
alias cot="git cot"
alias d="git d"
alias db="git db"
alias dbl="git dbl"
alias dblame=$HOME/.config/scripts/git-diff-blame.sh
alias dbp="git dbp"
alias dc="git dc"
alias dd="git dd"
alias ds="git ds"
alias f="git f"
alias gs="git subst"
alias ll=$HOME/.config/scripts/git-fzf-log.sh
alias lll="git lll"
alias m="git m"
alias ma="git ma"
alias p="git p"
alias pp="git pp"
alias psp="git pst"
alias psu="git psu"
alias pu="git pu"
alias puf="git puf"
alias puu="git puu"
alias pun="git pun"
alias r="git r"
alias ra="git ra"
alias rb="git rb"
alias rba="git rba"
alias rbc="git rbc"
alias rbd="git rbd"
alias rbm="git rbm"
alias rbo="git rbo"
alias rbos="git rbos"
alias revert="git revert"
alias rh="git rh"
alias rp="git rp"
alias rr="git rr"
alias s="git s"
alias sf="git sf"
alias sa="git sa"
alias sh="git sh"
alias shd="git shd"
alias shl="git shl"
alias show="git show"
alias sl="git sl"
alias sp="git sp"
alias ss="git ss"
alias st="git st"

# Alias common commands to better alternatives
alias ah="apt show"
alias ai="sudo apt-get install -y"
alias al="dpkg-query -L"
alias ar="sudo apt-get remove -y"
alias as="apt-file search --regexp"
alias au="sudo apt-get update"
alias ax="arc unarchive"
alias bat="batcat --style plain --theme ansi"
alias cat=bat
alias code="cursor $@"
alias de="docker exec --interactive --tty"
alias di="sudo dpkg -i"
alias dl="dpkg -c"
alias dp="docker ps --format \"table {{.Names}}\t{{.Status}}\t{{.Ports}}\""
alias dps="docker ps"
alias dr="docker run --interactive --rm --tty"
alias dra="dra download --automatic --install --output $HOME/.local/bin"
alias dsp="docker system prune -f"
alias feh="feh --image-bg black --keep-zoom-vp"
alias figlet="figlet-figlet -f slant -m 2"
alias g="grep --color=always --extended-regexp --ignore-case"
alias ghp="GH_CONFIG_DIR=$HOME/.config/gh-personal gh"
alias gl="g --files-with-matches"
alias gr="g --recursive"
alias grl="gr --files-with-matches"
alias gv="g --invert-match"
alias h=$HOME/.config/scripts/host-ssh-tty.sh
alias hn=$HOME/.config/scripts/host-network.sh
alias inf=infinity
alias ip="curl ip-api.com"
alias jqc="jq -C"
alias jql="jqc | less"
alias l="EZA_GRID_ROWS=50 eza --all --color=always --grid --group-directories-first --long --no-permissions --octal-permissions --smart-group"
alias la="l --absolute"
alias ld="lh --only-dirs"
alias lf="lh --only-files"
alias lh="l --total-size"
alias login="source $HOME/.config/scripts/clone-secrets.sh"
alias logout=$HOME/.config/scripts/clean-secrets.sh
alias ls=eza
alias lt="l --sort=modified"
alias mkx="chmod +x"
alias own="sudo chown -R $USER:$USER"
alias sc="cat package.json | jq .scripts"
alias strip=ansi2txt
alias sum="paste -sd+ - | bc"
alias t=tmux
alias ta="t attach-session -t"
alias tl="t ls"
alias tk="t kill-session -t"
alias ts="t choose-session"
alias tree="tree -C -I '.git|dist|node_modules|package-lock.json|tsconfig.tsbuildinfo' -L 2 --dirsfirst --noreport"
alias treea="tree -a"
alias treead="treea -d"
alias treed="tree -d"
alias treeda="treed -a"
alias v=vcsh
alias vd="vcsh foreach diff"
alias vs="vcsh status --terse"
alias vl="vcsh list"
alias x="xargs -I @"
alias zs="source $HOME/.zshrc; source $HOME/.zshenv"
alias zl="clear; zsh --login"
