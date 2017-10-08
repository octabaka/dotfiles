fpath=( "$HOME/.zfunctions" $fpath )
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
export WINEARCH=win32




export HISTSIZE=7000
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
alias l='ls -alh'
alias watch='watch -c -t'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --graph --oneline --all"
alias vim="nvim"
alias timer='termdown -b -t GOGOGO! -v fr-be'
alias ae='deactivate &> /dev/null; source ./venv/bin/activate'
alias de='deactivate'

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zshrc.local
#bindkey '^f' autosuggest-accept
bindkey '^f' forward-word

autoload -Uz compinit
compinit
