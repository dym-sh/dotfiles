#!/usr/bin/zsh

cd /Cfg/vscode/

mkdir -p ~/.config/Code/User/

ln -s `pwd`/*.json \
   ~/.config/Code/User/ --force
