#!/bin/bash

# mirroring of all github-(user|org) repos
# use: `gh-user-mirror GH_USER`
# TODO: --(no-)forks, --(no-)update, --sort <types>

## requires
# - `sudo apt install -y curl git`
# - `cargo install sd jql`

GH_USER="$1"
echo "Stars of Github User: '$GH_USER'"

PAGES=` curl --HEAD --silent "https://api.github.com/users/$GH_USER/starred?per_page=100" \
      | grep 'rel="last"' \
      | sd '^.+page=' '' \
      | sd '>; rel="last"[\n\r]+' '' \
      `
if [ -z "$PAGES" ]; then
  PAGES=1
fi

for LISTING_PAGE in `seq 1 1 "$PAGES"`; do
  echo ` curl --silent "https://api.github.com/users/$GH_USER/starred?per_page=100&page=$LISTING_PAGE" \
            | jql -i '.|"full_name"' \
            | tr ',' "\n" \
            | tr -d '[]"' \
       `
done
