# mysql
apt-get install -y \
  mysql-server

systemctl start mysql.service
mysql_secure_installation
systemctl status mysql.service

mysql -u root
```sql
CREATE DATABASE wp;
CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'STRONG_PASSWORD';
GRANT ALL PRIVILEGES ON wp.* TO 'db_admin'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
