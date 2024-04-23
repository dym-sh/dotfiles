#!/bin/sh

apt-get install -y \
  git git-lfs

VER='1.21.5-0'

wget  "https://codeberg.org/forgejo/forgejo/releases/download/v$VER/forgejo-$VER-linux-amd64.xz"
xz -d  "forgejo-$VER-linux-amd64.xz"

gpg --keyserver keys.openpgp.org \
    --recv EB114F5E6C0DC2BCDD183550A4B61A2DC5923710

chmod +x  "forgejo-$VER-linux-amd64"
mv  "forgejo-$VER-linux-amd64" \
    /usr/local/bin/forgejo
chmod -R 755 /usr/local/bin/forgejo


groupadd --system git
adduser --system \
   --ingroup git \
   git

mkdir -p  /home/git
chown git:git -R /home/git \
  && chmod -R 750 /home/git

mkdir /usr/local/bin/data/forgejo-repositories
chown git:git -R /usr/local/bin/data/forgejo-repositories \
  && chmod -R 770 /usr/local/bin/data/forgejo-repositories

mkdir /var/lib/forgejo
chown git:git -R /var/lib/forgejo \
  && chmod -R 750 /var/lib/forgejo

mkdir /usr/local/bin/data
chown root:git -R /usr/local/bin/data \
	&& chmod -R 770 /usr/local/bin/data

mkdir /usr/local/bin/log
chown root:git -R /usr/local/bin/log \
	&& chmod -R 770 /usr/local/bin/log

mkdir /usr/local/bin/custom
chown root:git -R /usr/local/bin/custom \
	&& chmod -R 770 /usr/local/bin/custom

mkdir /etc/forgejo
chown root:git -R /etc/forgejo \
  && chmod -R 770 /etc/forgejo

chown root:git /usr/local/bin/custom/conf/app.ini \
  && chmod 770 /usr/local/bin/custom/conf/app.ini

chown -R git:git  /usr/local/bin/data/indexers/issues.bleve

# test with `su - git -c 'forgejo'`
# deploy with `nohup forgejo >/dev/null 2>&1 &`

wget -O \
  /etc/systemd/system/forgejo.service \
  'https://codeberg.org/forgejo/forgejo/raw/branch/forgejo/contrib/systemd/forgejo.service'

chown root:git /etc/systemd/system/forgejo.service
chmod 770 /etc/systemd/system/forgejo.service

# If you’re not using sqlite, but MySQL or MariaDB or PostgreSQL, you’ll have to edit that file (/etc/systemd/system/forgejo.service) and uncomment the corresponding Wants= and After= lines. Otherwise it should work as it is.

systemctl enable forgejo.service
systemctl start forgejo.service


# open http://source.garden:3000
