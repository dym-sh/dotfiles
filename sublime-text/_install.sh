#!/usr/bin/zsh


# install sublime-text
wget -qO - \
  'https://download.sublimetext.com/sublimehq-pub.gpg' \
  | sudo apt-key add -
  
sudo apt install -y \
  apt-transport-https

echo 'deb https://download.sublimetext.com/ apt/stable/' \
  | sudo tee '/etc/apt/sources.list.d/sublime-text.list'

sudo apt update -y
sudo apt install -y \
  sublime-text


BIN='/Apps'

# aliases
ln  -s  '/opt/sublime_text/sublime_text'  "$BIN/s"


# link configs
mkdir -p  ~/.config/sublime-text/Packages/

mv  ~/.config/sublime-text/Packages/User \
  ~/.config/sublime-text/Packages/User_bak

cd /Cfg/sublime-text/

ln  -s  `pwd` \
  ~/.config/sublime-text/Packages/User
