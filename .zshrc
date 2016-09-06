fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

bindkey -v
bindkey -M viins '^b' up-line-or-history
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^f' down-line-or-history

export EDITOR='vim'
export VISUAL='vim'

alias ..='cd ..'

SAVEHIST=1000
HISTFILE=~/.zsh_history


[ -f ~/.zshrc.local ] && source ~/.zshrc.local 
