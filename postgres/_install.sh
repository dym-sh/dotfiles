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
sudo sh -c \
  "echo '$SRC' > /etc/apt/sources.list.d/pgdg.list"

curl -sS 'https://www.postgresql.org/media/keys/ACCC4CF8.asc' \
  | gpg --dearmor \
  | sudo tee /etc/apt/trusted.gpg.d/postgresql.gpg

sudo apt update -y
sudo apt install -y \
  postgresql

sudo systemctl start \
  postgresql
	# postgresql-client

VER=`psql --version | grep -Eo ' [0-9]+\.[0-9]+ ' | grep -Eo ' [0-9]+' | xargs`
echo $VER

sudo nano /etc/postgresql/$VER/main/pg_hba.conf
# `local all all trust`

sudo systemctl restart postgresql.service

sudo psql -U postgres
```
ALTER USER postgres WITH PASSWORD 'postgres';
exit;
```
