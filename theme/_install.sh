#!/usr/bin/zsh

sudo ln -s ~/.fonts /root/.fonts
sudo ln -s ~/.icons /root/.icons
sudo ln -s ~/.themes /root/.themes

mv  ~/.themes \
  ~/.themes_bak
ln -s /Data/Themes ~/.themes

mv  ~/.icons \
  ~/.icons_bak
ln -s /Data/Themes ~/.icons

mv  ~/.fonts \
  ~/.fonts_bak
ln -s /Data/Fonts ~/.fonts
