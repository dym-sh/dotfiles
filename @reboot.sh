#!/bin/sh

# ~/.xsession  >/dev/null 2>&1 &

/Cfg/kb/us-mac.sh >/dev/null 2>&1 &

imwheel    >/dev/null 2>&1 &
nfancurve  >/dev/null 2>&1 &
copyq      >/dev/null 2>&1 &

sleep 5 \
  && sshfs infra:/ /Servers/infra -C \
  >/dev/null 2>&1 &

sleep 5 \
  && sshfs sites:/ /Servers/sites -C \
  >/dev/null 2>&1 &

## already done in /etc/fstab
# sleep 5 \
#   && sudo mount 192.168.0.222:/nfs/Public  /Data \
#   >/dev/null 2>&1 &

# sudo mount 169.254.186.28:/nfs/Public  /Data   >/dev/null 2>&1 &
