#!/usr/bin/zsh

sudo apt install -y \
	software-properties-common \
	aptitude

sudo aptitude update
sudo aptitude -y install \
	php7.4 \
	composer

php -v

sudo aptitude install -y \
	libapache2-mod-php7.4 \
	libapache2-mod-fcgid \
	php7.4-apcu \
	php7.4-bcmath \
	php7.4-cli \
	php7.4-common \
	php7.4-curl \
	php7.4-gd \
	php7.4-imap \
	php7.4-intl \
	php7.4-json \
	php7.4-ldap \
	php7.4-mbstring \
	php7.4-mysql \
	php7.4-mysqli \
	php7.4-opcache \
	php7.4-readline \
	php7.4-soap \
	php7.4-xml \
	php7.4-zip

php -m

sudo a2enmod php7.4
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod proxy
sudo a2enmod proxy_http
sudo a2enmod headers

sudo systemctl restart apache2

sudo usermod -a -G www-data $USER
sudo chown -R $USER:www-data /var/www/
sudo chown -R www-data:www-data /var/lib/php/



sudo ln -s \
  '/Cfg/php/php7.ini' \
  '/etc/php/7.4/apache2/php.ini' --force
