#!/usr/bin/zsh

export SHELL='/usr/bin/zsh'
export HOME='/home/dym'
export LANG='en_US.UTF-8'
export ARCHFLAGS='-arch x86_64'

export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"

export QT_QPA_PLATFORMTHEME="gtk2"
# export QT_SCREEN_SCALE_FACTORS=1.5
# export QT_SCALE_FACTOR=1.5
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export TERMINAL=`which alacritty`
export EDITOR=`which sublime_text`

export PATH="/home/dym/.nix-profile/bin:/Apps:/usr/sbin:/usr/bin:/home/dym/.local/bin:/usr/bin:/usr/local/bin:/Data/Apps_and/platform-tools:/usr/local/sbin:/usr/local/bin"

export XDG_CONFIG_HOME="/home/dym/.config"

if [ -e /home/dym/.nix-profile/etc/profile.d/nix.sh ]; then
	. /home/dym/.nix-profile/etc/profile.d/nix.sh
fi # added by Nix installer