#!/usr/bin/zsh

sudo apt install -y \
  mysql-server

sudo systemctl start mysql.service

sudo mysql_secure_installation
sudo mysql

systemctl status mysql.service


sudo ln -s \
  '/Cfg/mysql/my.cnf' \
  '/etc/mysql/my.cnf' --force

sudo chown mysql:mysql /etc/mysql/my.cnf
sudo chmod 0640 /etc/mysql/my.cnf

sudo killall -9 mysql_secure_installation
# sudo mysql
sudo mysql -u root --skip-password

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'STRONG_PASSWORD_ROOT';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'STRONG_PASSWORD_ADMIN';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```


sudo chown -R mysql /var/lib/mysql
sudo chgrp -R mysql /var/lib/mysql
sudo chmod 755 /var/lib/mysql
