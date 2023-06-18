#!/usr/bin/zsh


# add PPA
sudo add-apt-repository -y \
  ppa:obsproject/obs-studio


# install OBS and additional tooling
sudo apt update -y
sudo apt install -y \
  obs-studio \
  ffmpeg \
  v4l2loopback-dkms
