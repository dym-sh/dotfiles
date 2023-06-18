#!/usr/bin/zsh

sudo mv /etc/apache2/sites-available  /etc/apache2/sites-available_bak
sudo mv /etc/apache2/sites-enabled    /etc/apache2/sites-enabled_bak

sudo ln -s /Cfg/apache/conf /etc/apache2/sites-available --force
sudo ln -s /Cfg/apache/conf /etc/apache2/sites-enabled --force

sudo mv /etc/hosts  /etc/hosts_bak
sudo ln -s /Cfg/apache/hosts /etc/hosts

sudo systemctl restart apache2.service

# sudo chown -R $USER:$USER
sudo mv /var/www /var/www_bak
sudo ln -s /Cfg/apache/var-www /var/www
