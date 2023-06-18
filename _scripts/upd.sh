#!/usr/bin/zsh

# .deb
sudo apt update -y
sudo apt upgrade -y

sudo apt-get autoclean -y
sudo apt-get remove --purge -y \
  software-properties-common
sudo apt-get autoremove -y
deborphan | xargs sudo apt-get -y remove --purge
sudo apt-get clean -y


# oh-my-zsh
cd ~/.oh-my-zsh/ \
  && ./tools/upgrade.sh \
  && cd -


# rust & co
rustup update
cargo install-update -a

# bun
bun upgrade

# deno
deno upgrade

