#!/usr/bin/zsh

# install imwheel
sudo apt install -y \
  imwheel


# start imwheel on reboot
echo "`crontab -l`
@reboot `which imwheel`
"  |  crontab -


# link config
cd /Cfg/imwheel/
ln -s  `pwd`/.imwheelrc  ~/  --force
