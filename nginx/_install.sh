#!/usr/bin/zsh

sudo apt install -y \
  nginx \
  nginx-extras

mkdir -p /etc/nginx/ssl/
openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
  -keyout /etc/nginx/ssl/nginx.key \
  -out /etc/nginx/ssl/nginx.crt

openssl dhparam -out /etc/nginx/dhparam.pem 4096
