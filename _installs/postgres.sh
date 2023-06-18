#!/usr/bin/zsh

# Postgres

# the `lsb_release` prints linux-mint's codename
# of which pg has no idea, so
U='UBUNTU_CODENAME='
DISTRO=`cat '/etc/os-release' | grep "$U"`
if [ ! -z "$DISTRO" ]; then
  DISTRO="${DISTRO/$U/}"
else
  DISTRO=`lsb_release -cs`
fi
echo "DISTRO: '$DISTRO'"


SRC="deb http://apt.postgresql.org/pub/repos/apt $DISTRO-pgdg main"
sh -c \
  "echo '$SRC' > /etc/apt/sources.list.d/pgdg.list"

wget --quiet -O - 'https://www.postgresql.org/media/keys/ACCC4CF8.asc' \
  | apt-key add -

curl -sS 'https://www.postgresql.org/media/keys/ACCC4CF8.asc' \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/postgresql.gpg

apt update -y
apt install -y \
  postgresql-14

psql --version

sudo systemctl start \
  postgresql-14 postgresql-client-14

sudo nano /etc/postgresql/14/main/pg_hba.conf
# `local all all trust`

sudo systemctl restart postgresql.service

psql -U postgres
```
ALTER USER postgres WITH PASSWORD 'postgres';
exit;
```
