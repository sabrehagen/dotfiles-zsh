install_apt_get_packages() {
  apt-get-userspace apt-file
  apt-get-userspace apt-utils
  apt-get-userspace bat
  apt-get-userspace build-essential
  apt-get-userspace curl
  apt-get-userspace docker-compose
  apt-get-userspace figlet
  apt-get-userspace htop
  apt-get-userspace jq
  apt-get-userspace keychain
  apt-get-userspace make
  apt-get-userspace nano
  apt-get-userspace ncdu
  apt-get-userspace net-tools
  apt-get-userspace openssl
  apt-get-userspace python3
  apt-get-userspace tree
  apt-get-userspace tmux
  apt-get-userspace unzip
  apt-get-userspace wget
  apt-get-userspace xz-utils

  wait

  # Update apt-get package system path references to userspace path references
  find $HOME/.apt/usr/bin -type f -exec grep -Il . {} \; | \
    xargs sed -i "s;#\!/;#\!$HOME/.apt/;"
}

install_dotfiles() {
  vcsh clone https://github.com/sabrehagen/dotfiles-scripts &
  vcsh clone https://github.com/sabrehagen/dotfiles-htop &
  vcsh clone https://github.com/sabrehagen/dotfiles-git &
  vcsh clone https://github.com/sabrehagen/dotfiles-nano &
  vcsh clone https://github.com/sabrehagen/dotfiles-ssh &
  vcsh clone https://github.com/sabrehagen/dotfiles-tmux &

  wait
}

install_github_releases() {
  wget -qnv -O $HOME/dra.deb https://github.com/devmatteini/dra/releases/download/0.6.2/dra_0.6.2-1_amd64.deb && \
    dpkg-deb -x $HOME/dra.deb $HOME/.apt && \
    rm $HOME/dra.deb

  dra eza-community/eza &
  dra fastfetch-cli/fastfetch &
  dra junegunn/fzf &
  dra xxxserxxx/gotop &
  dra gsamokovarov/jump && mv $HOME/.local/bin/jump* $HOME/.local/bin/jump &

  wait
}

install_npm_packages() {
  curl -fsSL https://nodejs.org/dist/v20.18.0/node-v20.18.0-linux-x64.tar.xz | \
    tar -C $HOME/.apt/usr -Jx --strip-components=1

  npm install --global clipboard-cli &
  npm install --global diff-so-fancy &
  npm install --global http-server &
  npm install --global nodemon &
  npm install --global rebase-editor &

  wait
}

install_python_packages() {
  curl -LsSf https://astral.sh/uv/install.sh | sh

  uv tool install --python 3.12 posting &
  uv tool install --python 3.12 shell-gpt &
  uv tool install --python 3.12 tldr &

  wait
}

install_dependencies() {
  install_dotfiles
  install_apt_get_packages
  install_github_releases
  install_npm_packages
  install_python_packages
}

if ! command -v batcat >/dev/null; then
  install_dependencies
fi
