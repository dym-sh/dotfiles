#!/usr/bin/zsh

DIRS=(
  '/_'
  '/Apps'
  '/Cfg'
  '/Data'
  '/My'
  '/Work'
)

# create dirs
sudo mkdir -m 755  $DIRS
sudo chown -R "$USER:$USER"  $DIRS
sudo chmod g+s -R  $DIRS

mkdir -m 700 \
  '/home/dym/.privat'


# uuids for fstab
lsblk -o 'UUID,NAME,FSTYPE,LABEL'
