#!/usr/bin/zsh

sudo apt-get remove -y \
  composer

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php 'composer-setup.php'
rm 'composer-setup.php'


sudo mkdir '/usr/local/bin/composer/'
sudo mv 'composer.phar' '/usr/local/bin/composer/'
