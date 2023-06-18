# mysql
apt-get install -y \
  mysql-server

systemctl start mysql.service
mysql_secure_installation
systemctl status mysql.service

mysql -u root
```sql
CREATE DATABASE wp;
CREATE USER 'db_admin'@'localhost' IDENTIFIED BY 'BjMPUpXtlUBHSr=l-TWYKHwCI7DPjF1YJMo2qpjW8LQI3Rk=EVKevexq6r3b+c6Ggf-cpk65nB-m8w=2';
GRANT ALL PRIVILEGES ON wp.* TO 'db_admin'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
