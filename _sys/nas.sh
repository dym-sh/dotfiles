#!/usr/bin/zsh

sudo mkdir '/Data'
sudo chown -R $USER:$USER '/Data'

sudo apt install -y \
  nfs-common sshfs


# add mount to fstab
echo '
# Data
192.168.0.5:/nfs/Public  /Data  nfs  auto  0  0
'  |  sudo tee -a '/etc/fstab'

