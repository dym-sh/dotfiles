#!/usr/bin/zsh


# install zsh
sudo apt  install  -y  \
  zsh git


# install oh-my-zsh
sudo sh  -c  "$(curl  -fsSL  'https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh')"
sudo chsh -s `which zsh`


# link dotfiles
cd /Cfg/oh-my-zsh/
ln  -s  `pwd`/.[a-zA-Z]*  ~/  --force


git clone --depth 1 \
  'https://github.com/chisui/zsh-nix-shell.git' \
  "$ZSH_CUSTOM/plugins/nix-shell"

# maybe add to .zshrc
# ZSH_CUSTOM=$HOME/.config/oh-my-zsh

