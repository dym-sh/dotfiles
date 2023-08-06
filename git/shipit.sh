#!/usr/bin/zsh

# sync hyperdrive or create a new one
# if [ -f './.hyper' ]; then
#   hyp sync ./ `cat ./.hyper` # -y
# else
#   echo 'Create new hyper-drive?'
#   hyp sync ./
# fi

# add ssh keys
eval `ssh-agent -s`
ssh-add ~/.ssh/source-garden

# create placeholder commit message if none provided
COMMIT="$1"
[ -z "$COMMIT" ] \
  && COMMIT="__ $(date '+%Y%m%d@%H%M%S')"

git commit -am "$COMMIT"

# push all branches to every mirror
git push --all
