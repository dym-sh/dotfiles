#!/bin/sh

DOMAIN='_homepage'

PROJ='$1'

# git
adduser git
mkdir '/home/git/.ssh'
nano '/home/git/.ssh/authorized_keys'

# new repo
git init --bare '/home/git/repos/digisign'
mkdir -p '/var/www/digisign/'
git clone '/home/git/repos/digisign' '/var/www/digisign'

# post-push resolving
cd '/home/git/repos/digisign/'
exec git-update-server-info
echo '#!/bin/sh
cd "/var/www/digisign/" || exit
unset GIT_DIR
git pull
exec git-update-server-info
' > '/home/git/repos/digisign/hooks/post-update'
chmod +x '/home/git/repos/digisign/hooks/post-update'


# access rights
chown -R git:git '/home/git'
chown -R git:www-data '/home/git/repos'
chmod -R 755 '/home/git/repos'


# cd /var/www/digisign/public/www/
# ln -s ../../static ./

# adduser www
# usermod -aG www-data www
usermod -aG www-data git
chown -R git:www-data '/var/www/digisign'
chmod -R 755 '/var/www/digisign'


# mkdir '/var/www/digisign/uploads'
# touch '/var/www/digisign/nohup.out'
# touch '/var/www/digisign/log.txt'

# starting scripts
# chown -R www:www-data '/var/www/digisign'
# su - www -c  'cd /var/www/digisign && ./start'
# echo '@reboot su - www -c  'cd /var/www/digisign && ./start'' \
#   >> /etc/crontab
