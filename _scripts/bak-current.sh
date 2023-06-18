#!/usr/bin/zsh

BAK="/media/dym/priv_bak"
if [ ! -z "$1" ]; then
  BAK="$1"
fi


cd `realpath "$0" | xargs dirname`
./bak-home.sh "$BAK/Home"

DIRS=(
  Apps
  Cfg
  Projects
  Site
  Work
)
for DIR in "${DIRS[@]}"; do
  echo "-
-
# '$DIR'"
  sudo \
  rsync -zrhP --links --size-only --verbose --delete \
    --exclude '**/.Trash-1000' \
    --exclude '**/__sapper__/' \
    --exclude '**/node_modules/' \
    --exclude '**/target/' \
    "/$DIR/" \
    "$BAK/${DIR}"
done
