#!/usr/bin/zsh


# remove unneeded
sudo apt-get purge -y \
  celluloid hypnotix hexchat \
  onboard pix gnote drawing xviewer \
  redshift warpinator orca

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
  nano ffmpeg lynx \
  imagemagick graphicsmagick ghostscript \
  jpegoptim pngcrush pngquant \
  usrmerge net-tools rdfind ripgrep
  # fonts-font-awesome \


# desktop
sudo apt install -y \
  numlockx sshfs


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
  xdotool

sudo systemctl disable rsyslog
sudo systemctl stop rsyslog

sudo timedatectl set-timezone Europe/Berlin


