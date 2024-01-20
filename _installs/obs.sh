#!/usr/bin/zsh


# add PPA
sudo add-apt-repository -y \
  ppa:obsproject/obs-studio


# install OBS and additional tooling
sudo apt-get update -y
sudo apt-get install -y \
  obs-studio \
  v4l2loopback-dkms
#  ffmpeg \

