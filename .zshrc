fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

bindkey -v
bindkey -M viins '^b' up-line-or-history
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^f' down-line-or-history
bindkey -M viins '^n' down-line-or-history
bindkey '^r' history-incremental-search-backward

export EDITOR='vim'
export VISUAL='vim'


export HISTSIZE=7000
export HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt share_history
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
alias optipng='optipng -o7 -strip all'
alias gs="git status"
alias gc="git commit -a"
alias gg="git log --graph --oneline --all"



[ -f ~/.zshrc.local ] && source ~/.zshrc.local
