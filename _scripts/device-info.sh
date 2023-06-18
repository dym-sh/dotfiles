#!/usr/bin/zsh

# devices info
sudo apt install -y \
  hddtemp lm-sensors


sudo hddtemp /dev/sd*

sudo sensors-detect
sudo sensors



free -h

sensors

sudo hddtemp SATA:/dev/sda
sudo hddtemp SATA:/dev/sdb
sudo hddtemp SATA:/dev/sdc
sudo hddtemp SATA:/dev/sdd


# hdd details
iostat -dx /dev/sd*
