#!/usr/bin/env bash
#
[[ $- == *i* ]] && stty -ixon

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

ulimit -S -c 0 # Don't want coredumps.
set -o vi
set -o histexpand
TERM=xterm-256color
# HISTCONTROL=ignoredups:erasedups
# hstr now
export GOPATH=$HOME/go
export NODE_PATH=/home/octa/.node_modules
export PATH=$PATH:${GOPATH}/bin
export PATH=$PATH:$HOME/.node_modules/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$HOME/.local/bin
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export GDK_SCALE=1.25
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=0.75

export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/nvim

# export LS_COLORS='di=04;01;38;5;33:ow=04;01;38;5;33;48;2;60;10;0'
export LS_COLORS='di=01;38;5;33:ow=04;01;38;5;33;48;2;60;10;0'
export LESS_TERMCAP_mb=$'\e[1;33m'
export LESS_TERMCAP_md=$'\e[1;93m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

export PAGER="less"

export npm_config_prefix=~/.node_modules

alias debug="set -o nounset; set -o xtrace"
alias timer='termdown -b -t GOGOGO!'
# alias mpv='devour mpv'
alias n='vimpc'
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
alias feh='pqiv'
alias reboot='systemctl reboot --firmware-setup'
alias screen='escrotum -s -C'
alias njr='nomad job run'
alias njs='nomad stop -purge'
alias ap='ansible-playbook'
alias vim='nvim'


#BEPO
function qwer() {
	setxkbmap fr bepo
}
function bépo() {
	setxkbmap ch fr
	xmodmap -e 'remove Lock = Caps_Lock'
	xmodmap -e 'keycode 49 = Escape'                 #49 = tilda
	xmodmap -e 'keycode 66 = Escape NoSymbol Escape' # 66 = verr maj
	xset m 0 0
	xset r rate 200 50
	# xmodmap -e 'keycode 49=Escape'
}

# export TESSDATA_PREFIX=/usr/share/tessdata

export PS1=" \[\e[00;93m\]λ \[\e[00;34m\]\W \[\e[00;31m\]\$(git branch 2>/dev/null | grep '^*' | colrm 1 2) \[\e[0m\]"
# PS1='[\u@\h \W]\$ '
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules --exclude \*.png --exclude \*.jpg --exclude __sapper__'
# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                            # hh to be alias for hstr
export HSTR_CONFIG=hicolor               # get more colors
shopt -s histappend                      # append new history items to .bash_history
export HISTCONTROL=ignorespace:erasedups # leading space hides commands from history
export HISTFILESIZE=10000                # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}          # increase history size (default is 500)
# ensure synchronization between bash memory and history file
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# eval "$(jump shell)"
# export PROMPT_COMMAND='history -a; history -n; __jump_prompt_command;'
export PROMPT_COMMAND="history -a;"

# shellcheck disable=SC1091
[[ -s "/home/octa/.autojump/etc/profile.d/autojump.sh" ]] && source "/home/octa/.autojump/etc/profile.d/autojump.sh"

# export PROMPT_COMMAND='history -a; history -n; __jump_prompt_command; printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\e^ihh \n"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# shellcheck disable=SC1091
source "/home/octa/.config/broot/launcher/bash/br"

# COMPLETION

# ! = inverse
complete -f -o default -X !'*.+(mp4|mkv|avi)' tomp4
complete -f -d -o dirnames -X "!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|\
asf|vob|VOB|bin|dat|vcd|ps|pes|fli|viv|rm|ram|yuv|mov|MOV|rmvb|\
QT|wmv|mp3|MP3|ogg|OGG|ogm|OGM|mp4|MP4|wav|m4a|WAV|asx|ASX|m3u|mkv|webm)" mpv

# FUNCTIONS
function extract() { # Handy Extract Program
	if [ -f "$1" ]; then
		case $1 in
		*.tar.bz2) tar xvjf "$1" ;;
		*.tar.gz) tar xvzf "$1" ;;
		*.bz2) bunzip2 "$1" ;;
		*.rar) unrar x "$1" ;;
		*.gz) gunzip "$1" ;;
		*.tar) tar xvf "$1" ;;
		*.tbz2) tar xvjf "$1" ;;
		*.tgz) tar xvzf "$1" ;;
		*.zip) unzip "$1" ;;
		*.Z) uncompress "$1" ;;
		*.7z) 7z x "$1" ;;
		*) echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file!"
	fi
}

function proxy_enable() {
	export http_proxy='http://192.168.1.100:3128'
	export https_proxy='http://192.168.1.100:3128'
}
function proxy_disable() {
	unset http_proxy
	unset https_proxy
}

export NOMAD_ADDR=http://localhost:4646
# export NOMAD_CACERT=~/devops/cluster/certs/nomad/nomad-ca.pem
# export NOMAD_CLIENT_CERT=~/devops/cluster/certs/nomad/cli.pem
# export NOMAD_CLIENT_KEY=~/devops/cluster/certs/nomad/cli-key.pem

export CONSUL_HTTP_ADDR=localhost:8500

export GEM_HOME=~/.ruby/
export PATH="$PATH:~/.ruby/bin"

complete -C /usr/local/bin/consul consul
complete -C /usr/local/bin/nomad nomad
_vm_options=$(~/.local/bin/vm options)
complete -W "${_vm_options}" vm

export VAGRANT_CWD=/home/octa/devops/vagrant/nomad

export WINEARCH=win64
export WINEDEBUG=-all
# export WINEPREFIX=/home/octa/wine/rl
export LGDRY_WINE_BINARY=/home/octa/.local/share/lutris/runners/wine/lutris-6.1-x86_64/bin/wine



