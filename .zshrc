!/usr/bin/zsh

source ~/.profile

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME='agnoster'
CASE_SENSITIVE='false'
DISABLE_LS_COLORS='true'
COMPLETION_WAITING_DOTS='true'
HIST_STAMPS='yyyy-mm-dd'

plugins=( git )
source "$ZSH/oh-my-zsh.sh"


alias bc='bc -l'
alias l='ls -alhg --group-directories-first'
alias ll='l -R'
alias ls='ls -AF --group-directories-first'
alias d='du -ch --max-depth=1'
alias md='mkdir'

alias i='apt-get install -y'
alias un='apt-get remove -y'
alias x='chmod +x'

alias upd='
apt-get update -y;
apt-get upgrade -y;
apt-get autoremove -y;
apt-get autoclean -y;
'
alias i='apt-get install -y'
alias un='apt-get remove -y'
