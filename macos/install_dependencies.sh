# Install brew first
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install dependencies
brew install \
  bat \
  bash-completion \
  coreutils \
  dnsmasq \
  doctl \
  dos2unix \
  fontforge \
  fortio \
  fzf \
  git \
  gnupg \
  grep \
  htop \
  jq \
  libmaxminddb \
  libsmi \
  libssh \
  lsusb \
  lua@5.1 \
  neofetch \
  neovim \
  nghttp2 \
  nnn \
  nmap \
  nvm \
  p7zip \
  pkg-config \
  python@2 \
  ripgrep \
  screenfetch \
  telnet \
  tmux \
  tree \
  watch \
  watchman \
  wget \
  wrk \
  yarn

# Install python packages
pip3 install \
  black \
  flake8 \
  ipython \
  matplotlib \
  neovim \
  pandas \
  pip \
  pipupgrade \
  pyvim \
  sklearn \
  tensorflow
