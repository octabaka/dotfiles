fpath=( "$HOME/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt pure

bindkey -v
#bindkey -M viins '^b' up-line-or-history
bindkey -M viins '^p' up-line-or-history
#bindkey -M viins '^f' down-line-or-history
bindkey -M viins '^n' down-line-or-history
bindkey '^r' history-incremental-search-backward

export EDITOR='nvim'
export VISUAL='nvim'
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export WINEARCH=win64




export HISTSIZE=2000
export HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
#setopt share_history
setopt hist_ignore_space

export SAVEHIST=$HISTSIZE

setopt no_flowcontrol
setopt autocd
setopt rm_star_wait
setopt list_types
setopt no_auto_name_dirs

alias ..='cd ..'
alias ls='ls --color=auto'
alias l='ls -alh'
alias watch='watch -c -t'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --graph --oneline --all"
alias vim="nvim"
alias timer='termdown -b -t GOGOGO! -v fr-be'
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'
alias go='grc go'
alias mpv='mpv --no-audio-display'
alias bb='brunch build'
alias bw='brunch watch -s'
alias data='/opt/JetBrains/apps/datagrip/ch-0/172.4574.13/bin/datagrip.sh'
alias sl='noglob streamlink'
function sshmysql() { ssh -p 17171 root@$1 -L 3306:127.0.0.1:3306 -N }

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zshrc.local
#bindkey '^f' autosuggest-accept
bindkey '^f' forward-word

autoload -Uz compinit
compinit

export PATH="$HOME/.yarn/bin:$PATH"
export TERM="xterm-256color"
