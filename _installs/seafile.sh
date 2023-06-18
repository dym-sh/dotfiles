#!/usr/bin/zsh

# seafile
# /from https://help.seafile.com/syncing_client/install_linux_client/

sudo wget 'https://linux-clients.seafile.com/seafile.asc' \
  -O '/usr/share/keyrings/seafile-keyring.asc'

sudo bash -c "
  echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/focal/ stable main' \
    > /etc/apt/sources.list.d/seafile.list
  "

sudo apt update -y
sudo apt install -y \
  seafile-gui

# opt debug
sudo apt-get install -y \
  libsearpc-dbg \
  ccnet-dbg \
  libccnet-dbg \
  seafile-daemon-dbg \
  libseafile-dbg \
  seafile-gui-dbg

