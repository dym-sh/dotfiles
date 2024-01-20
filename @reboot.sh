#!/bin/sh

# ~/.xsession  2>&1  &

imwheel  2>&1  &
nfancurve  2>&1  &
copyq  2>&1  &

sleep 5 && \
  sshfs infra:/ /Servers/infra -C  2>&1  &

## already done in /etc/fstab
sleep 5 && \
sudo mount 192.168.0.222:/nfs/Public  /Data   2>&1  &
# sudo mount 169.254.186.28:/nfs/Public  /Data   2>&1  &
