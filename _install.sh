#!/bin/sh

# latest git
add-apt-repository -y \
  ppa:git-core/ppa

# core apps and utils
apt-get upgrade -y
apt-get install -y \
  build-essential \
  certbot \
  clang \
  curl \
  ffmpeg \
  g++ \
  ghostscript \
  git\
  graphicsmagick \
  imagemagick \
  jpegoptim \
  lynx \
  make \
  nginx \
  pkg-config \
  pngcrush \
  pngquant \
  postgresql \
  postgresql-contrib \
  rdfind \
  sshfs \
  ufw \
  wget \
  zsh


# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


# python3 & co
apt-get install -y \
  python-is-python3 \
  python3 \
  python3-pip

ln -s /usr/bin/pip3 \
      /usr/local/bin/pip

pip install pipupgrade
pipupgrade -y --pip --ignore-error


# nodejs
rm -rf \
  /usr/local/bin/node* \
  /usr/local/bin/npm \
  /usr/local/include/node* \
  /usr/local/lib/node* \
  /usr/local/share/man/man1/node* \
  ~/.npm

apt-get purge -y \
  nodejs npm
apt-get autoremove -y

VER='18.18.1'
wget 'https://nodejs.org/dist/v$VER/node-v$VER-linux-x64.tar.xz'
tar -xf 'node-v$VER-linux-x64.tar.xz'
rm 'node-v$VER-linux-x64.tar.xz'
mv node-v$VER-linux-x64/bin/* \
  /usr/local/bin/
mv node-v$VER-linux-x64/lib/node_modules/ \
  /usr/local/lib/

npm i -g npm
npm i -g n svgo


# rust
apt-get install -y \
  openssl libssl1.1 libssl-dev \
  libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev

curl --proto '=https' \
  --tlsv1.2 -sSf 'https://sh.rustup.rs' \
  | sh

source $HOME/.cargo/env

rustup toolchain install nightly \
  --allow-downgrade \
  --profile minimal \
  --component clippy

rustup default nightly

env LIBSSH2_SYS_USE_PKG_CONFIG='' \
  cargo install \
    cargo-update

## cargo apps
cargo install \
  xh bat exa fd-find \
  broot jql sd \
  xargo



# mail
apt-get install -y \
  apt-transport-https ca-certificates \
  gnupg-agent software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
  | apt-key add -

apt-key fingerprint 0EBFCD88

add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

apt-get update -y
apt-get install -y \
  docker-ce docker-ce-cli containerd.io

docker pull analogic/poste.io
docker run \
  --detach \
  --restart always \
  --name 'mailserver' \
  --hostname 'mail.dym.sh' \
  --publish 25:25 \
  --publish 465:465 \
  --publish 587:587 \
  --publish 993:993 \
  --publish 4190:4190 \
  --publish 12080:80 \
  --publish 12443:443 \
  --volume /etc/localtime:/etc/localtime:ro \
  --volume /var/mail/data:/data \
  --tty analogic/poste.io


# # hypercore
# npm i -g @hyperspace/cli
# hyp daemon start
# echo "`crontab -l`
# @reboot /usr/local/bin/hyp daemon start
# " | crontab -


# assign hostname
hostname 'dym.sh'
echo 'dym.sh' > /etc/hostname


# no logs
systemctl stop rsyslog.service
systemctl disable rsyslog.service