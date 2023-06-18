#!/usr/bin/zsh

# video-drivers related things for GL context
sudo apt-get install -y \
  ibus ibus-data ibus-gtk ibus-gtk3 \
  libegl1-mesa libgl1-mesa-glx \
  libxcb-xtest0 python3-ibus-1.0


# install sublime-merge
wget -qO - \
  'https://download.sublimetext.com/sublimehq-pub.gpg' \
  | sudo apt-key add -

sudo apt install -y \
  apt-transport-https

echo 'deb https://download.sublimetext.com/ apt/stable/' \
  | sudo tee '/etc/apt/sources.list.d/sublime-text.list'

sudo apt update -y
sudo apt install -y \
  sublime-merge


BIN=/Apps

# aliases
ln  -s  '/opt/sublime_merge/sublime_merge'  "$BIN/sublime_merge"


# link configs
mkdir -p  ~/.config/sublime-merge/Packages/

mv  ~/.config/sublime-merge/Packages/User \
  ~/.config/sublime-merge/Packages/User_bak

cd /Cfg/sublime-merge/

ln  -s  `pwd` \
  ~/.config/sublime-merge/Packages/User
