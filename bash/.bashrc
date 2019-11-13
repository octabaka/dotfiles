#
# ~/.bashrc
#
stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

set -o vi
set -o histexpand


TERM=xterm-256color

export npm_config_prefix=~/.node_modules


alias timer='termdown -b -t GOGOGO! -v fr-be'
alias mpv='mpv --no-audio-display'
alias n='ncmpcpp'
alias s='sudo systemctl'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
alias chromium='chromium --ignore-gpu-blacklist'

alias rm='gio trash'
alias ..='cd ..'
alias ls='ls --color=auto'
alias l='ls -alh'
alias watch='watch -c -t'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --graph --oneline --all"
alias go='grc go'
alias p='ps axf --format "pid %cpu %mem cmd"'
alias pp='ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem"'
alias pc='watch -n 0 "lscpu | grep MHz"'

#BEPO
alias qwer='setxkbmap fr bepo'
alias bépo='setxkbmap ch fr'

export PS1=" \[\e[00;93m\]λ \[\e[00;34m\]\W \[\e[0m\]"
# PS1='[\u@\h \W]\$ '


[[ -s /home/octa/.autojump/etc/profile.d/autojump.sh ]] && source /home/octa/.autojump/etc/profile.d/autojump.sh



