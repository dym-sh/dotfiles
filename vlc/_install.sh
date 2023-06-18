#!/usr/bin/zsh


# install vlc
sudo apt install -y \
  vlc


# link config
mkdir  -p  ~/.config/vlc

cd /Cfg/vlc/

ln  -s  `pwd`/v* \
  ~/.config/vlc \
  --force
