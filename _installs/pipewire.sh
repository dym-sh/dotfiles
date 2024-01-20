#!/bin/sh


sudo add-apt-repository -y \
	ppa:pipewire-debian/pipewire-upstream
sudo add-apt-repository -y \
	ppa:pipewire-debian/wireplumber-upstream

sudo apt-get update -y

sudo apt install -y \
	gstreamer1.0-pipewire \
	libpipewire-0.3-{0,dev,modules} \
	libspa-0.2-{bluetooth,dev,jack,modules} \
	pipewire{,-{audio-client-libraries,pulse,bin,jack,alsa,v4l2,libcamera,locales,tests}}

sudo apt install -y pipewire-doc

