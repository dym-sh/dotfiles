#!/usr/bin/zsh

apt update
apt upgrade
apt install software-properties-common apt-transport-https curl -y

curl -fsSl https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor | tee /usr/share/keyrings/postgresql.gpg > /dev/null

sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get -y update
apt-get install postgresql-15 -y

systemctl enable postgresql
systemctl start postgresql
systemctl status postgresql

ss -antpl | grep 5432

systemctl start \
  postgresql postgresql-client


nano /etc/postgresql/15/main/pg_hba.conf
# `local  all  all  trust`

systemctl restart postgresql

# psql -U postgres
su postgres -c psql
```
ALTER USER postgres WITH PASSWORD 'postgres';
exit;
```
