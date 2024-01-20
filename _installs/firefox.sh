#!/usr/bin/zsh

# install firefox
sudo apt update -y
sudo apt install -y \
  firefox


USER=`cat  ~/.mozilla/firefox/profiles.ini \
    | grep  -E  'Default=.{2,}$' \
    | grep  -oE  '[a-zA-Z0-9_\.\-]{2,}$' \
    `
echo "Firefox USER: '$USER'"


# link userChrome
mkdir  -p  ~/.mozilla/firefox/$USER/chrome/
ln  -s  `pwd`/userChrome.css \
  ~/.mozilla/firefox/$USER/chrome/ \
  #  --force

# link userContent
ln  -s  `pwd`/userContent.css \
  ~/.mozilla/firefox/$USER/chrome/ \
  #  --force



# dev branch

echo 'deb http://deb.debian.org/debian/ unstable main contrib non-free' \
  | sudo tee -a '/etc/apt/sources.list'

echo 'Package: *
Pin: release a=stable
Pin-Priority: 900

Package: *
Pin release a=unstable
Pin-Priority: 10
'  |  sudo tee -a '/etc/apt/preferences.d/99pin-unstable'

sudo apt update -y
sudo apt install -yt unstable firefox
