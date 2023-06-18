#!/usr/bin/zsh


sudo apt-get install -y \
	libwxbase3.0-0v5 \
	libwxgtk3.0-gtk3-0v5 \
	xclip

wget https://github.com/federico-terzi/espanso/releases/download/v2.1.8/espanso-debian-x11-amd64.deb

sudo apt install ./espanso-debian-x11-amd64.deb

espanso service register

espanso start