# Load antigen plugin manager
source antigen.zsh

# Use oh-my-zsh framework
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle git
antigen bundle git-auto-fetch
antigen bundle helm
antigen bundle kubectl
antigen bundle ubuntu

# Bundles from third parties
antigen bundle buonomo/yarn-completion
antigen bundle lukechilds/zsh-nvm
antigen bundle popstas/zsh-command-time
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme
antigen theme avit

# Apply antigen plugins
antigen apply

# Load jump shell
eval "$(jump shell zsh)"
