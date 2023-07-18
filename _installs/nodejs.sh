#!/usr/bin/zsh


# optional: remove old installs
sudo apt purge -y \
  nodejs npm
sudo apt autoremove -y

sudo rm /usr/bin/node
sudo rm /usr/bin/npm
sudo rm -rf /usr/share/npm
sudo rm -rf /usr/share/nodejs


# install node + npm
wget -O 'node.xz' \
  'https://nodejs.org/dist/v18.16.0/node-v18.16.0-linux-x64.tar.xz'
tar -xf 'node.xz'
rm 'node.xz'
sudo mv node-v18.16.0-linux-x64/bin/* /usr/local/bin/
sudo mv node-v18.16.0-linux-x64/lib/node_modules/ /usr/local/lib/

sudo mkdir -p  \
  '/usr/lib/nodejs' \
  '/usr/lib/node_modules'


# fix permissions
sudo chown -R $USER:$USER \
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
