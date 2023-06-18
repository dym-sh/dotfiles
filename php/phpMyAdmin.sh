# phpMyAdmin
mysql -u root
```sql
CREATE DATABASE phpmyadmin CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
CREATE USER 'phpmyadmin'@'localhost' IDENTIFIED BY 'XNyXHt82zp=6zzfvGruYBt_Wi0pOaGZjVou63XKO9S5KmEqVrNCk=_oV+WLSw3hvuk-gKH1tVvKkERg5quOg1G7OmIfmw=uP+NE84uLXArqwNTSwtKHiuqI=zJXmqy9z';
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'phpmyadmin'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

apt-get install -y \
  phpmyadmin mlocate apache2-utils

updatedb
locate php.ini

nano /etc/php/7.4/fpm/php.ini
```ini
file_uploads = On
upload_max_filesize = 32M
max_execution_time = 300
memory_limit = 256M
post_max_size = 32M
max_input_time = 300
max_input_vars = 4440
date.timezone = Europe/Berlin
```

chown www-data:www-data /var/www/html/phpmyadmin -R
chown www-data:www-data /etc/phpmyadmin -R
chmod 660  /etc/phpmyadmin -R
chmod 777 /var/www/html/phpmyadmin/tmp -R


cp '/var/www/html/phpmyadmin/config.sample.inc.php' \
  '/var/www/html/phpmyadmin/config.inc.php'

