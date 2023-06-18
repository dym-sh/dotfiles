#!/bin/bash

# update current
apt-get update -y
apt-get upgrade -y


# sys, tools
apt-get install -y \
  zsh curl wget git \
  g++ make clang build-essential \
  rmlint ffmpeg lynx \
  net-tools usrmerge \
  imagemagick graphicsmagick ghostscript \
  jpegoptim pngquant pngcrush


# users

adduser git
mkdir '/home/git/.ssh'
touch '/home/git/.ssh/authorized_keys'
  # add ssh-key for git

adduser www
mkdir '/home/www/.ssh'
touch '/home/www/.ssh/authorized_keys'
  # add ssh-key for www

usermod -aG www-data www
usermod -aG www-data git


# access rights
chown -R www:www-data '/var/www/site/'
