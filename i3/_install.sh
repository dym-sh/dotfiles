#!/usr/bin/zsh

# install i3 + rofi
sudo apt install -y \
  i3 rofi


# backup current config
mv ~/.config/i3/config \
   ~/.config/i3/config_`date '+%Y-%m-%d@%H-%M'`.bak

# link new config
mkdir -p ~/.config/i3/
cd /Cfg/i3/
ln -s `pwd`/config \
   ~/.config/i3/


# restart i3
i3-msg restart
