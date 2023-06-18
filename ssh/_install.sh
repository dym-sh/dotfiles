#!/usr/bin/zsh


# link ssh dir
mv ~/.ssh ~/.ssh_bak
ln -s '/home/dym/.privat/ssh' ~/.ssh


BIN=~/.local/bin

# link connection scripts
ln  -s  ~/.ssh/server.sh  "$BIN/server"  # --force
ln  -s  ~/.ssh/server-fs.sh  "$BIN/server-fs"  # --force
ln  -s  ~/.ssh/server-fs-www.sh  "$BIN/server-fs-www"  # --force
