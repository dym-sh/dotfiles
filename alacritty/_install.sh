#!/usr/bin/zsh

sudo apt install -y \
  python3 cmake pkg-config \
  libfreetype6-dev libfontconfig1-dev \
  libxcb-xfixes0-dev libxkbcommon-dev


# # install rust
# ../_installs/rust.sh


cargo install alacritty

# link config
mkdir -p ~/.config/alacritty/
cd /Cfg/alacritty/

ln -s `pwd`/alacritty.* \
   ~/.config/alacritty/ --force
