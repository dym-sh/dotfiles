#!/usr/bin/zsh

BAK="/Data/_bak"


# restic init '/home/dym/.privat' \
#   -p '/home/dym/.privat/restic/p.txt' \
#   -r  "$BAK/.privat"

restic backup '/home/dym/.privat' \
  -p '/home/dym/.privat/restic/p.txt' \
  -r "$BAK/.privat"


cd `realpath "$0" | xargs dirname`
./bak-home.sh "$BAK/Home"


sudo \
rsync -zrhP --links --size-only --verbose --delete \
  --exclude '**/.Trash-1000' \
  --exclude '**/__sapper__/' \
  --exclude '**/node_modules/' \
  --exclude '**/target/' \
  "/My/" \
  "/Data/_my"


sudo \
rsync -zrhP --links --size-only --verbose --delete \
  --exclude '**/.Trash-1000' \
  --exclude '**/__sapper__/' \
  --exclude '**/node_modules/' \
  --exclude '**/target/' \
  "/Work/" \
  "$BAK/work-aggents"


DIRS=(
  Apps
  Cfg
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
