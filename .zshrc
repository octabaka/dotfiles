fpath=( "$HOME/.zfunctions" $fpath )

autoload -Uz compinit
compinit
fpath=(~/.zsh/completion $fpath)

autoload -U promptinit; promptinit
prompt pure

bindkey -v
#bindkey -M viins '^b' up-line-or-history
bindkey -M viins '^p' up-line-or-history
#bindkey -M viins '^f' down-line-or-history
bindkey -M viins '^n' down-line-or-history
bindkey '^r' history-incremental-search-backward

export EDITOR='vim'
export VISUAL='vim'
export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
#export WINEARCH=win64




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
alias kub="kubectl"
# alias vim="nvim"
alias timer='termdown -b -t GOGOGO! -v fr-be'
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'
alias go='grc go'
alias mpv='mpv --no-audio-display'
alias bb='brunch build'
alias bw='brunch watch -s'
alias sl='noglob streamlink'
alias n='ncmpcpp'
alias em='emacs -nw'
alias p='ps axf --format "pid %cpu %mem cmd"'
alias pp='ps ax --format "pid %cpu %mem cmd" --sort "%cpu %mem"'
alias pc='watch -n 0 "lscpu | grep MHz"'
alias s='sudo systemctl'
# alias pbcopy='xclip -selection clipboard'
# alias pbpaste='xclip -selection clipboard -o'
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

alias chromium='chromium --ignore-gpu-blacklist'
alias ngc='ng g c --inline-template --inline-style --spec false --flat'
function sshmysql() { ssh -p 17171 root@$1 -L 3306:127.0.0.1:3306 -N }

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#bindkey '^f' autosuggest-accept
bindkey '^f' forward-word


export PATH="$HOME/.gem/ruby/2.5.0/bin:$HOME/.yarn/bin:$PATH"
export TERM="xterm-256color"

# if [ -x /usr/local/bin/taoup -a -x /usr/local/bin/taoup-fortune ]; then
	#    taoup-fortune
	# fi

# LEADER TEST
# eval "$(leader init)"

export PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

source ~/.zshrc.local
source ~/.local/share/icons-in-terminal/icons_bash.sh

