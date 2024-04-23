#!/bin/sh


# remove unneeded
sudo apt-get purge -y \
  celluloid hypnotix hexchat \
  onboard pix gnote xviewer \
  redshift warpinator orca
# drawing

# remove default wallpapers
sudo rm -rf \
  /usr/share/wallpapers/

# update current
sudo apt update -y
sudo apt upgrade -y


# tools
sudo apt install -y \
  zsh curl wget git \
  g++ make clang build-essential \
  nano ffmpeg lynx feh \
  imagemagick graphicsmagick ghostscript \
  jpegoptim pngcrush pngquant \
  usrmerge net-tools rdfind ripgrep \
  sqlite3 exa \
  nfs-common sshfs archivemount
  # fonts-font-awesome \


# GUI Apps
sudo apt install -y \
  vlc \
  lxappearance \
  kid3 \
  gparted \
  pavucontrol \
  dconf-editor \
  kcharselect \
  kid3 \
  gnumeric \
  xdotool \
  numlockx \
  copyq \
  imwheel



sudo systemctl disable rsyslog
sudo systemctl stop rsyslog

sudo timedatectl set-timezone Europe/Berlin

sudo visudo
## or sudo nano /etc/sudoers
## add the line
# Defaults        timestamp_timeout=-1
