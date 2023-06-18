#!/usr/bin/zsh

sudo apt update -y

sudo apt build-dep -y --fix-missing \
  python-imaging


sudo apt install -y \
  gimagereader \
  tesseract-ocr-all


tesseract input.png output --oem 1 -l eng

