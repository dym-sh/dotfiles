#!/usr/bin/zsh

# purge memory
free -h

echo "clearing memory"
sudo sync
sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
free -h


# clear logs
echo "clearing /var/log"
sudo du -hs /var/log
sudo find /var/log -type f -delete
sudo du -hs /var/log

#
rm -rf /var/lib/systemd/coredump/*

echo "clearing /etc/apache2/logs"
sudo du -hs /etc/apache2/logs
sudo find /etc/apache2/logs -type f -delete
sudo du -hs /etc/apache2/logs

rm ~/.xsession-errors*


# empty trash
rm -rf ~/.local/share/Trash
sudo rm -rf /root/.local/share/Trash/*
sudo rm -rf /_/.Trash-1000
sudo rm -rf /[A-Z]*/.Trash-1000
sudo rm -rf /media/*/.Trash-1000
sudo rm -rf /media/*/*/.Trash-1000
# rm -rf /_servers/*/.Trash-1000


#Cleaning the old kernels
dpkg-query -l | grep 'linux-im*'
#dpkg-query -l | grep linux-im* | awk '{print $2}'

sudo apt-get purge -y  $(dpkg -l 'linux-*' \
  | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | head -n -1) \
  --assume-yes

sudo apt-get install -y  linux-headers-`uname -r \
  |cut -d'-' -f3`-`uname -r \
  |cut -d'-' -f4`
