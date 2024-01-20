#!/usr/bin/zsh

# get all the fonts
sudo apt install -y \
  'fonts-noto-*'

# uninstall outdated noto-emoji
sudo apt-get purge -y \
  fonts-noto-color-emoji
sudo apt-get purge -y \
  fonts-symbola ttf-ancient-fonts-symbola

# get latest noto-emoji
mkdir -p  ~/.fonts/NotoEmoji/

curl -L  'https://raw.githubusercontent.com/googlefonts/noto-emoji/main/fonts/NotoColorEmoji.ttf' \
     -o  ~/.fonts/NotoEmoji/NotoColorEmoji.ttf

ln -s  ~/.fonts/NotoEmoji \
       '/usr/local/share/fonts/'

# link font-priority config
cd /Cfg/emoji/
ln -s  `pwd`/.fonts.conf \
  ~/  --force

mkdir -p ~/.config/fontconfig/
ln -s  `pwd`/.fonts.conf \
  ~/.config/fontconfig/fonts.conf  --force

# rebuild fonts-cache
fc-cache -f -v


firefox 'https://getemoji.com'
