#!/bin/sh
# install go

VER='1.22.1'

wget -c "https://go.dev/dl/go$VER.linux-amd64.tar.gz"

rm -rf /Apps/go--app
mkdir -p /Apps/go--app

tar -xzf "go$VER.linux-amd64.tar.gz" \
	  -C "/Apps/go--app"

mv /Apps/go--app/go/* '/Apps/go--app/'
chown $USER:$USER -R "/Apps/go--app"
ln -s /Apps/go--app/bin/* /Apps/ --force

rm "go$VER.linux-amd64.tar.gz"
rm -rf /Apps/go--app/go
