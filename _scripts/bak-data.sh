#!/usr/bin/zsh

BAK="/media/data_bak"
if [ ! -z "$1" ]; then
  BAK="$1"
fi

DIRS=(
	Apps_andr
	Apps_deb
	Apps_wnd
	Audio
	Books
	Bugs
	Code
	Drivers
	Fonts
	Img
	Iso
	Music
	Posts
	Texts
	Video
)
for DIR in "${DIRS[@]}"; do
  echo "-
-
# '$DIR'"
  sudo \
  rsync -zrhP --links --size-only --verbose --delete \
    --exclude '**/.Trash-1000' \
    "/Data/${DIR}/" \
    "$BAK/${DIR}"
done
