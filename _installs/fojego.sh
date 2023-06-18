apt-get install -y \
  git git-lfs

wget https://codeberg.org/forgejo/forgejo/releases/download/v1.19.3-0/forgejo-1.19.3-0-linux-amd64
chmod +x forgejo-1.19.3-0-linux-amd64

gpg --keyserver keys.openpgp.org --recv EB114F5E6C0DC2BCDD183550A4B61A2DC5923710
wget https://codeberg.org/forgejo/forgejo/releases/download/v1.19.3-0/forgejo-1.19.3-0-linux-amd64.asc
gpg --verify forgejo-1.19.3-0-linux-amd64.asc forgejo-1.19.3-0-linux-amd64

mv forgejo-1.19.3-0-linux-amd64 /usr/local/bin/forgejo
chmod 755 /usr/local/bin/forgejo


groupadd --system git

adduser --system --shell /bin/bash --comment 'Git Version Control' \
   --gid git --home-dir /home/git --create-home git

mkdir /var/lib/forgejo
chown git:git /var/lib/forgejo \
  && chmod 750 /var/lib/forgejo

mkdir /usr/local/bin/data
chown root:git /usr/local/bin/data \
	&& chmod 770 /usr/local/bin/data

mkdir /usr/local/bin/log
chown root:git /usr/local/bin/log \
	&& chmod 770 /usr/local/bin/log

mkdir /usr/local/bin/custom
chown root:git /usr/local/bin/custom \
	&& chmod 770 /usr/local/bin/custom

mkdir /etc/forgejo
chown root:git /etc/forgejo \
  && chmod 770 /etc/forgejo


wget -O \
  /etc/systemd/system/forgejo.service \
  'https://codeberg.org/forgejo/forgejo/raw/branch/forgejo/contrib/systemd/forgejo.service'

# If you’re not using sqlite, but MySQL or MariaDB or PostgreSQL, you’ll have to edit that file (/etc/systemd/system/forgejo.service) and uncomment the corresponding Wants= and After= lines. Otherwise it should work as it is.

systemctl enable forgejo.service
systemctl start forgejo.service

# open http://source.garden:3000

