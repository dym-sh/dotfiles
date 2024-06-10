#!/bin/sh

mkdir -p  ~/.mozilla/firefox/dym/chrome/

cd '/My/config/browser-addons/'
ln -s  `pwd`/userChrome.css \
  ~/.mozilla/firefox/dym/chrome/  # --force
