#!/bin/sh

DOMAIN='_homepage'

PROJ='$1'
HOST='test-01'

# git
adduser git
mkdir '/home/git/.ssh'
nano '/home/git/.ssh/authorized_keys'

# new repo
git init --bare '/home/git/repos/$HOST'
mkdir -p '/var/www/$HOST/'
git clone '/home/git/repos/$HOST' '/var/www/$HOST'

# post-push resolving
cd '/home/git/repos/$HOST/'
exec git-update-server-info
echo '#!/bin/sh
cd "/var/www/$HOST/" || exit
unset GIT_DIR
git pull
exec git-update-server-info
' > '/home/git/repos/$HOST/hooks/post-update'
chmod +x '/home/git/repos/$HOST/hooks/post-update'


# access rights
chown -R git:git '/home/git'
chown -R git:www-data '/home/git/repos'
chmod -R 755 '/home/git/repos'


# cd /var/www/$HOST/public/www/
# ln -s ../../static ./

# adduser www
# usermod -aG www-data www
usermod -aG www-data git
chown -R git:www-data '/var/www/$HOST'
chmod -R 755 '/var/www/$HOST'


# mkdir '/var/www/$HOST/uploads'
# touch '/var/www/$HOST/nohup.out'
# touch '/var/www/$HOST/log.txt'

# starting scripts
# chown -R www:www-data '/var/www/$HOST'
# su - www -c  'cd /var/www/$HOST && ./start'
# echo '@reboot su - www -c  'cd /var/www/$HOST && ./start'' \
#   >> /etc/crontab
