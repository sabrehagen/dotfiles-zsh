ZSH_CONFIG=$HOME/.config/zsh

source $ZSH_CONFIG/aliases.zsh
source $ZSH_CONFIG/plugins.zsh
source $ZSH_CONFIG/dependencies.zsh
source $ZSH_CONFIG/colors.zsh
source $ZSH_CONFIG/exports.zsh
source $ZSH_CONFIG/setopt.zsh
source $ZSH_CONFIG/prompt.zsh
source $ZSH_CONFIG/completions.zsh
source $ZSH_CONFIG/functions.zsh
source $ZSH_CONFIG/hooks.zsh
source $ZSH_CONFIG/widgets.zsh
source $ZSH_CONFIG/bindkeys.zsh
source $ZSH_CONFIG/history.zsh
source $ZSH_CONFIG/zle.zsh

# Move to home directory if started in root directory
if [ "$PWD" = / ]; then
  cd $HOME
fi
