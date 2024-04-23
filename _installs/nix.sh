#!/usr/bin/env zsh

sudo mkdir /nix
sudo chown $USER:$USER /nix
sudo chmod g+s /nix

sh <(curl -L https://nixos.org/nix/install) --no-daemon
