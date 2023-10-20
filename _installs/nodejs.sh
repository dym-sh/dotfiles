#!/usr/bin/zsh


# optional: remove old installs
apt purge -y \
  nodejs npm
apt autoremove -y

rm /usr/bin/node
rm /usr/bin/npm
rm -rf /usr/share/npm
rm -rf /usr/share/nodejs

VER='18.18.0'

mv node-v$VER-linux-x64/bin/* \
   /usr/local/bin/
mv node-v$VER-linux-x64/lib/node_modules/ \
   /usr/local/lib/

mkdir -p  \
  '/usr/lib/nodejs' \
  '/usr/lib/node_modules'


# fix permissions
chown -R $USER:$USER \
  '/usr/local' \
  '/usr/share' \
  '/usr/lib/nodejs' \
  '/usr/lib/node_modules'


# install version manager
npm i -g n

# bump node to latest LTS version
n lts

# update npm
npm i -g npm
