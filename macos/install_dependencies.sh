# Install brew first 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install dependencies
brew install \
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
  heroku/brew/heroku \
  htop \
  jq \
  kubectx \
  kubernetes-helm \
  libmaxminddb \
  libsmi \
  libssh \
  lsusb \
  lua@5.1 \
  midnight-commander \
  neofetch \
  neovim \
  nghttp2 \
  nmap \
  nvm \
  p7zip \
  pkg-config \
  python@2 \
  ripgrep \
  screenfetch \
  telnet \
  tmux \
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
