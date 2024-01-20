#!/bin/sh

sudo add-apt-repository -y \
  ppa:transmissionbt/ppa

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y \
  transmission-gtk

