#!/bin/bash

# > clone and open for editing a newly forked git repo

## requires
# - `sudo apt install git`
# - `cargo install sd`

# add ssh keys
eval `ssh-agent -s`
ssh-add ~/.ssh/github-com
ssh-add ~/.ssh/gitlab-com
ssh-add ~/.ssh/self-site_git


REPO="$1"
# i.e. `git@github.com:dym-sh/elixir-style-guide.git`
SAVE_PATH=/_
if [ ! -z "$2" ]; then
  SAVE_PATH="$2"
fi



DIR=` echo "$REPO" \
    | sd -f i '(https://|git@)' '' \
    | sd -f i 'github\.com(/|:)?' '' \
    | sd -f i '\.git$' '' \
    | sd -- '([\w\.-]+)/([\w\.-]+)' '$2--$1' \
    | sd -- '([\w\.-]+)/([\w\.-]+)' '$2--$1' \
    | sd -- '([\w\.-]+):([\w\.-]+)' '$2@$1' \
    | sd -- '/' '--' \
    `

cd "$SAVE_PATH"
git clone --depth 1 "$REPO" "$DIR"
subl "$DIR"

