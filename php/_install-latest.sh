#!/bin/sh

sudo apt install -y \
	software-properties-common \
	aptitude

sudo aptitude update
sudo aptitude -y install \
	apache2 \
	php \
	composer

php -v

sudo aptitude install -y \
	libapache2-mod-php \
	libapache2-mod-fcgid \
	php-apcu \
	php-bcmath \
	php-cli \
	php-common \
	php-curl \
	php-gd \
	php-imap \
	php-intl \
	php-json \
	php-ldap \
	php-mbstring \
	php-mysql \
	php-mysqli \
	php-opcache \
	php-pgsql \
	php-readline \
	php-soap \
	php-xml \
	php-zip

php -m

sudo a2enmod php8.1
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod headers

sudo systemctl restart apache2

sudo usermod -a -G www-data $USER
sudo chown -R $USER:www-data /var/www/
sudo chown -R www-data:www-data /var/lib/php/


## 7.x
# sudo ln -s \
#   '/Cfg/php/php7.ini' \
#   '/etc/php/7.4/apache2/php.ini' --force

## 8.x
# sudo ln -s \
# 	'/Cfg/php/php8.ini' \
# 	'/etc/php/8.1/apache2/php.ini' --force
