#!/usr/bin/zsh

sudo apt install -y \
  git \
  p7zip-full \
  python3-pip \
  python3-wxgtk4.0 \
  grub2-common \
  grub-pc-bin \
  build-essential


# install
sudo add-apt-repository -y \
  ppa:tomtomtom/woeusb

sudo apt update -y
sudo apt install -y \
  woeusb \
  wimlib-imagex \
  wimtools


# get disk list
sudo fdisk -l

# use
sudo woeusb \
  --target-filesystem NTFS \
  -d /Data/Iso/wnd-10.iso \
  /dev/sdX
