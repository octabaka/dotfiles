#
# ~/.bashrc
#
stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
set -o histexpand


TERM=xterm-256color
HISTCONTROL=ignoredups:erasedups

export npm_config_prefix=~/.node_modules


alias timer='termdown -b -t GOGOGO!'
#alias mpv='devour mpv --no-audio-display'
alias n='ncmpcpp'
alias s='sudo systemctl'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias chromium='chromium --ignore-gpu-blacklist'

# alias rm='gio trash'
alias ..='cd ..'
alias ls='ls --color=auto'
alias l='ls -alh'
alias watch='watch -c -t'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --decorate --graph --oneline --all"
alias go='grc go'
alias p='ps axf --format "pid %cpu %mem cmd"'
alias pp='ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem"'
alias pc='watch -n 0 "lscpu | grep MHz"'
alias cleanup='yay -Sc && sudo journalctl --vacuum-time=1d'
alias ra='ranger'
alias du='ncdu'
alias find='fd'

#BEPO
alias qwer='setxkbmap fr bepo'
alias bépo='setxkbmap ch fr'

export LS_COLORS='di=04;01;38;5;33:ow=04;01;38;5;33;48;2;60;10;0'
# export TESSDATA_PREFIX=/usr/share/tessdata

export PS1=" \[\e[00;93m\]λ \[\e[00;34m\]\W \[\e[00;31m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \[\e[0m\]"
# PS1='[\u@\h \W]\$ '


[[ -s /home/octa/.autojump/etc/profile.d/autojump.sh ]] && source /home/octa/.autojump/etc/profile.d/autojump.sh




source /home/octa/.config/broot/launcher/bash/br


