#!/usr/bin/zsh


sudo apt-get install -y \
  libgdk-pixbuf-xlib-2.0-0 \
  libgdk-pixbuf2.0-0


# get XnView
wget 'https://download.xnview.com/XnViewMP-linux-x64.deb'
sudo dpkg -i 'XnViewMP-linux-x64.deb'
rm 'XnViewMP-linux-x64.deb'


# link config
mkdir -p ~/.config/xnviewmp/
cd /Cfg/xnviewmp/

ln -s `pwd`/xnview.ini ~/.config/xnviewmp/ --force
