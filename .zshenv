alias cat=bat

export PATH=$HOME/bin:$HOME/go/bin:/snap/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.local/bin:$HOME/.yarn/bin:$PATH

keychain $HOME/.ssh/id_rsa >/dev/null 2>&1
source $HOME/.keychain/$(hostname)-sh

cd ~/repositories/stemn/stemn-backend
