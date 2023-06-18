#!/usr/bin/zsh

Y=`date '+%Y'`
M=`date '+%m'`


IMG_PATH="/Data/Img/$Y/$M/"
[ ! -d "$IMG_PATH" ] \
  && mkdir -p "$IMG_PATH"
mv /_/*.(jpg|png|gif|webp|avif|svg) "$IMG_PATH"


DUST_PATH='/Data/Video/yt/@watchdust/'
[ ! -d "$DUST_PATH" ] \
  && mkdir -p "$DUST_PATH"
mv /_/yt-Sci-Fi*.(mp4|webm|mkv) "$DUST_PATH"


VID_PATH="/Data/Video/$Y/$M/"
[ ! -d "$VID_PATH" ] \
  && mkdir -p "$VID_PATH"
mv /_/*.(mp4|webm|mkv|mov|3gp|avi|mp2) "$VID_PATH"
