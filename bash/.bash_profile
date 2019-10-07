#
# ~/.bash_profile
#
export GOPATH=$HOME/go
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:$HOME/.node_modules/bin


[[ -f ~/.bashrc ]] && . ~/.bashrc

export GDK_SCALE=1.25
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=0.75

export BROWSER=/usr/bin/chromium
export EDITOR=/usr/bin/vim



if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
