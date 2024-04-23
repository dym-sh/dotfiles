#!/usr/bin/zsh

sudo add-apt-repository -y \
  ppa:trebelnik-stefina/grub-customizer

# sudo add-apt-repository ppa:danielrichter2007/grub-customizer

sudo apt update -y
sudo apt install -y \
  grub-customizer

sudo grub-customizer
