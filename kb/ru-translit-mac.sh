#!/bin/sh

setxkbmap -layout 'ru,us' -variant 'phonetic_mac,mac'

numlockx  off

# xset  s  off
# xset  s  noblank
xset  b  off
xset  -dpms

# xrdb  -merge  /etc/X11/xinit/.Xresources
xrdb  -merge  ~/.Xresources
# xmodmap  /etc/X11/xinit/.Xmodmap
xmodmap  ~/.Xmodmap
