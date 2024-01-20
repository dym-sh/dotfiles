#!/bin/sh


# install go

wget -c 'https://go.dev/dl/go1.19.4.linux-amd64.tar.gz'

sudo rm -rf '/Apps/go--app/*'
tar -C '/Apps/go--app' -xzf 'go1.19.4.linux-amd64.tar.gz'
rm 'go1.19.4.linux-amd64.tar.gz'
sudo chown $USER:$USER -R '/usr/local/go'
sudo ln -s /usr/local/go/bin/* /Apps/ --force

