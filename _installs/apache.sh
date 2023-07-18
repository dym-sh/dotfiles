#!/usr/bin/zsh

sudo mv /etc/apache2/sites-available  /etc/apache2/sites-available_bak
sudo mv /etc/apache2/sites-enabled    /etc/apache2/sites-enabled_bak

sudo ln -s /Cfg/apache/conf /etc/apache2/sites-available --force
sudo ln -s /Cfg/apache/conf /etc/apache2/sites-enabled --force

sudo systemctl restart apache2.service
