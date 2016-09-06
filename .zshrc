fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure
bindkey -v

export EDITOR='vim'
export VISUAL='vim'





[ -f ~/.zshrc.local ] && source ~/.zshrc.local 
