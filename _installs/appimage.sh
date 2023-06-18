#!/usr/bin/zsh

sudo apt install -y \
  python3-pip \
  python3-setuptools \
  patchelf \
  desktop-file-utils \
  libgdk-pixbuf2.0-dev \
  fakeroot \
  strace \
  fuse

# Install appimagetool AppImage
sudo wget \
  'https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage' \
  -O /usr/local/bin/appimagetool

sudo chmod +x \
  /usr/local/bin/appimagetool
