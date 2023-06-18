#!/usr/bin/zsh

# print screen all monitors

import -window root \
  "/_/PrtScr--$(date '+%Y%m%d@%H%M%S').png"
