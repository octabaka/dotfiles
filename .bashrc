#!/usr/bin/env bash
#
[[ $- == *i* ]] && stty -ixon

[[ $- != *i* ]] && return

ulimit -S -c 0
set -o vi
set -o histexpand

# pour lf
set shellopts '-eu'
set ifs "\n"

TERM=xterm-256color
export PS1="\[\e[00;93m\]🐈\[\e[00;32m\]\u@\h \[\e[00;34m\]\W \[\e[0m\]"
# PS1='[\u@\h \W]\$ '
unalias -a
alias ..='cd ..'
alias ls='ls --color=auto'
alias l='ls -alh'
alias watch='watch -c -t '
alias ga="git add ."
alias gs="git status"
alias gc="git commit -a"
alias gd="git diff"
alias gl="git log --decorate --graph --oneline --all"
alias gp="git push"
alias gco="git checkout"
alias p='ps axf --format "pid user %cpu %mem cmd" | grep -v chrome | grep -v chromium | grcat conf.ps'
alias pp='grc ps axf --format "pid %cpu %mem cmd"'
alias ppp='grc ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem"'
alias cpu='watch -n 0 "lscpu | grep MHz"'
alias du='ncdu -x'
alias find='fd -E .git -E node_modules'
alias m='make'
alias vim="nvim"
alias v="nvim"
alias ns="netstat -tulpn"
alias ip="ip -c -br"
alias nlr="nft list ruleset"
alias dig="dig +nocmd +nocomments +noquestion"
alias idf="source /work/dev/ESP32/esp-idf/export.sh"
alias ju="just"
alias mem="ps -e -orss=,args= | sort -b -k1,1n"
alias memw="watch 'ps -e -orss=,args= | sort -b -k1,1n | tail -n30'"

bind -m vi-insert '"\e[15~": "source ~/.bashrc\C-m"'
#
find_commandu="fd"
if command -v "fd" &>/dev/null; then
  find_commandu="fd"
elif command -v "fdfind" &>/dev/null; then
  find_commandu="fdfind"
fi

export FZF_DEFAULT_COMMAND="$find_commandu --type f --follow --exclude .git --exclude node_modules --exclude \*.png --exclude \*.jpg --exclude __sapper__"
export FZF_DEFAULT_OPTS='--bind "tab:down,shift-tab:up"'
export HISTCONTROL=ignorespace:ignoredups:erasedups
export HISTFILESIZE=10000                # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}          # increase history size (default is 500)
export PROMPT_COMMAND="history -a;"
# shopt -s histappend                      # append new history items to .bash_history

# FUNCTIONS
function gr() {
  local include
  if [[ -z "$2" ]]; then
    include=""
  else
    include="--include=$2"
  fi
  local grep='grep -EIHnri \
    --exclude-dir=node_modules \
    --exclude-dir=.git \
    --exclude-dir=venv \
    --exclude-dir=__pycache__ \
    --exclude-dir=__sapper__ \
    --exclude-dir=.next \
    --color=always' 
  local -r cols=$(tput cols)
  local my_cut="cut -b 1-$cols"
  local final="$grep $include $1 | $my_cut"
    eval "$final"

    # --include=${include:-} \
    # "$1" | cut -b 1-"$(tput cols)"
}
function pw() {
  my_ps='ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem" | tail -n 10'
  watch -n 1 "$my_ps"
}

# When set to 1, z will print the matched directory before navigating to it.
if command -v "zoxide" &>/dev/null; then
  export _ZO_ECHO=0
  eval "$(zoxide init bash --cmd j)"
fi

if [ -f ~/.bashrc_desktop ]; then
  source ~/.bashrc_desktop
fi

if [ -f /usr/share/doc/fzf/examples/key-bindings.bash ]; then
  source /usr/share/doc/fzf/examples/key-bindings.bash
fi

if [ -f /usr/share/doc/fzf/examples/completion.bash ]; then
  source /usr/share/doc/fzf/examples/completion.bash
fi

if [ -f /usr/bin/mcli ]; then
  complete -C /usr/bin/mcli mcli
fi
