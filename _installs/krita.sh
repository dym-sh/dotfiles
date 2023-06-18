#!/usr/bin/zsh

sudo add-apt-repository -y \
  ppa:kritalime/ppa

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y

sudo apt-get install -y \
  krita
