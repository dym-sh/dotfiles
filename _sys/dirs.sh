#!/usr/bin/env zsh

DIRS=(
  /_
  /Apps
  /Books
  /Cfg
  /Code
  /Fonts
  /Forks
  /Servers
  /Data
  /Img
  /Music
  /My
  /Work
  /Ui
)

# create dirs
for DIR in $DIRS; do
  sudo mkdir -m 755  $DIR
  sudo chown -R "$USER:$USER"  $DIR
  sudo chmod g+s -R  $DIR
done

# mkdir -m 700 \
#  /home/dym/.privat


# uuids for fstab
lsblk -o 'UUID,NAME,FSTYPE,LABEL'
