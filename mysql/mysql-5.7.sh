wget https://dev.mysql.com/get/mysql-apt-config_0.8.12-1_all.deb
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 467B942D3A79BD29
sudo dpkg -i mysql-apt-config_0.8.12-1_all.deb
sudo apt-get update -y
sudo apt-cache policy mysql-server
sudo apt-get install -y \
  -f 'mysql-client=5.7*' 'mysql-community-server=5.7*' 'mysql-server=5.7*'

sudo chown -R mysql:mysql /var/lib/mysql/
sudo chmod -R 755 /var/lib/mysql/

sudo systemctl restart mysql.service

sudo chown -R www-data:www-data /var/www


dpkg -i ./mysql-common_5.7.42-1debian10_amd64.deb
dpkg -i ./mysql-community-client_5.7.42-1debian10_amd64.deb
dpkg -i ./mysql-client_5.7.42-1debian10_amd64.deb
dpkg -i ./mysql-community-server_5.7.42-1debian10_amd64.deb
dpkg -i ./mysql-community-server-dbgsym_5.7.42-1debian10_amd64.deb
