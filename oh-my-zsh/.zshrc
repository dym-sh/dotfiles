#!/usr/bin/zsh

source ~/.profile

ZSH="$HOME/.oh-my-zsh"
ZSH_THEME='lambda'
CASE_SENSITIVE='false'
DISABLE_LS_COLORS='true'
COMPLETION_WAITING_DOTS='true'
HIST_STAMPS='yyyy-mm-dd'

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt histignorealldups

plugins=(  git  )
source "$ZSH/oh-my-zsh.sh"


# oh-my-zsh newline after promt for the theme lambda
PROMPT='$fg[red]%n$reset_color@$fg[blue]%m$reset_color [`date "+%Y-%m-%d %a %H:%M:%S.%N"`] > %~ $(git_prompt_info)%{$reset_color%}
λ '


# aliases
alias bc='bc -l'
alias l='exa -alhg --git --group-directories-first --color-scale -s ext'
alias md='mkdir'
alias ll='l -T'
alias ls='ls -alhgAF --group-directories-first'
alias d='du -ch --max-depth=1'

alias i='sudo apt-get install -y'
alias un='sudo apt-get remove -y'

alias subs='youtube-dl --write-auto-sub --sub-lang en'

alias x+='chmod +x'
alias x-='chmod -x'

alias rmlint='rdfind -dryrun true'

# keys
# [Ctrl-Backspace] - delete whole backward-word
bindkey -M emacs '^H' backward-kill-word
bindkey -M viins '^H' backward-kill-word
bindkey -M vicmd '^H' backward-kill-word


# functions

# split string=$2 using separator=$1
str_split() {
  echo "$2" | sd "$1" '\n'
}

# display hex color
clr() {
  printf '\e]4;1;%s\a\e[0;41m      \n\e[m' "$1"
}


# bun
[ -s "/home/dym/.bun/_bun" ] && source "/home/dym/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# deno
export DENO_INSTALL="/home/dym/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
