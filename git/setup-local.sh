#!/bin/sh

SERVER_ID='<SERVER.IP OR DOMAIN.TLD>'

ssh-copy-id -i ~/.ssh/server_root.pub "root@$SERVER_ID"
ssh-copy-id -i ~/.ssh/server_www.pub "www@$SERVER_ID"
ssh-copy-id -i ~/.ssh/server_git.pub "git@$SERVER_ID"

cd "/Site/$SERVER_ID"

git remote add prod "webing-poligon-git:~/repos/digisign"
git push prod --all --force
git push prod --tags --force
