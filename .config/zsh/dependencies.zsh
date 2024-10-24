install_apt_get_packages() {
  apt-get-userspace \
    apt-file \
    apt-utils \
    bat \
    build-essential \
    curl \
    docker-compose \
    figlet \
    htop \
    jq \
    keychain \
    make \
    nano \
    ncdu \
    net-tools \
    openssl \
    python3 \
    tmux \
    tree \
    unzip \
    wget \
    xz-utils

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

  dra() {
    command dra download --automatic --install --output $HOME/.local/bin $1
  }

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

  npm install --global \
    clipboard-cli \
    diff-so-fancy \
    http-server \
    nodemon \
    rebase-editor
}

install_python_packages() {
  curl -fsSL https://astral.sh/uv/install.sh | sh

  uv tool install posting &
  uv tool install shell-gpt &
  uv tool install tldr &

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
