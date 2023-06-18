#!/usr/bin/zsh

# home.sh
BAK='/Data/_bak/Home'
if [ ! -z "$1" ]; then
  BAK="$1"
fi

echo "BAK: backing up  '$HOME'  to  '$BAK'"


# bak $HOME to Data or $BAK
  # --exclude '.config/smartsvn/' \
  # --exclude '.config/libreoffice/' \
  # --exclude '.eclipse/' \
  # --exclude '.fonts/' \
  # --exclude '.local' \

rsync -rhP --links --size-only --verbose --delete \
  --exclude '**/.Trash-1000/' \
  --exclude '**/*.log' \
  --exclude '**/*.part' \
  --exclude '**/*~' \
  --exclude '**/hyphen-data/' \
  --exclude '**/logs/' \
  --exclude '**/node_modules/' \
  --exclude '**/storage/default/' \
  --exclude '**/datareporting/' \
  --exclude '.local/share/lutris' \
  --exclude '.local/share/Trash' \
  --exclude '.android/' \
  --exclude '.bun/' \
  --exclude '.zoom/' \
  --exclude '.cabal/' \
  --exclude '.cache/' \
  --exclude '.cargo/' \
  --exclude '.cinnamon/' \
  --exclude '.config/agregore-browser/' \
  --exclude '.config/chromium/' \
  --exclude '.config/google-chrome/' \
  --exclude '.config/google-chrome-unstable/' \
  --exclude '.config/vivaldi/' \
  --exclude '.config/Code/Cache*' \
  --exclude '.config/Code/Service Worker/' \
  --exclude '.config/Code/Crashpad/' \
  --exclude '.config/Code/User/History/' \
  --exclude '.config/Code/User/workspaceStorage/' \
  --exclude '.config/xnviewmp/' \
  --exclude '.deno/' \
  --exclude '.electron-gyp/' \
  --exclude '.figma/' \
  --exclude '.gnupg/' \
  --exclude '.gphoto/' \
  --exclude '.gnome/' \
  --exclude '.docker/' \
  --exclude '.gradle/' \
  --exclude '.java/' \
  --exclude '.linuxmint/' \
  --exclude '.node/' \
  --exclude '.npm/' \
  --exclude '.nv/' \
  --exclude '.pipupgrade/' \
  --exclude '.pki/' \
  --exclude '.privat/' \
  --exclude '.Private/' \
  --exclude '.pub-cache/' \
  --exclude '.rustup/' \
  --exclude '.ssh' \
  --exclude '.steam*' \
  --exclude 'Android/' \
  --exclude 'FontBase/' \
  --exclude 'Games/' \
  --exclude 'go/' \
  --exclude 'Private/' \
  --exclude 'snap/' \
  --exclude 'Steam/' \
  --exclude 'tmp/' \
  --exclude '.thunderbird' \
  "/home/dym/" \
  "$BAK"
