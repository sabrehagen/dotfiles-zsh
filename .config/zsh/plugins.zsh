# Ensure plugin manager is installed
if [ ! -d $HOME/.zgenom ]; then
  git clone --depth 1 https://github.com/jandamm/zgenom.git $HOME/.zgenom
fi

# Load zgenom plugin manager
source $HOME/.zgenom/zgenom.zsh

# If no zgenom static init exists
if ! zgenom saved; then

  # Use oh-my-zsh framework
  zgenom oh-my-zsh

  # Bundles from oh-my-zsh
  zgenom oh-my-zsh plugins/command-not-found
  zgenom oh-my-zsh plugins/fzf
  zgenom oh-my-zsh plugins/git
  zgenom oh-my-zsh plugins/gnu-utils
  zgenom oh-my-zsh plugins/grc

  # Bundles from third parties
  zgenom load grigorii-zander/zsh-npm-scripts-autocomplete
  zgenom load paulirish/git-open
  zgenom load popstas/zsh-command-time
  zgenom load zdharma-continuum/fast-syntax-highlighting
  zgenom load zsh-users/zsh-autosuggestions
  zgenom load zsh-users/zsh-completions
  zgenom load zsh-users/zsh-history-substring-search

  # Load the theme
  zgenom oh-my-zsh themes/avit

  # Generate zgenom static init
  zgenom save
fi
