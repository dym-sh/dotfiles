#!/usr/bin/zsh


# keyboard settings
setxkbmap  -option  caps:none
setxkbmap  -option  altwin:swap_alt_win
setxkbmap  -option  lv3:ralt_switch
setxkbmap  us  -variant  mac

numlockx  off

# xset  s  off
# xset  s  noblank
xset  b  off
xset  -dpms

# xrdb  -merge  /etc/X11/xinit/.Xresources
xrdb  -merge  ~/.Xresources
# xmodmap  /etc/X11/xinit/.Xmodmap
xmodmap  "$HOME/.Xmodmap"


# reset audio
pulseaudio  -k


# start-apps
/Cfg/@reboot.sh  2>&1  &

# xrandr --output DP-0 --scale 1x1 --fb 3840x2160 --mode 3840x2160 --pos 0x0
# xrandr --output HDMI-0 --scale 1x1 --mode 1920x1080 --pos 3840x0

