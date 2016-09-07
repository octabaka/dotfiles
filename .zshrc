fpath=( "$HOME/.zfunctions" $fpath )

autoload -U promptinit; promptinit
prompt pure

bindkey -v
bindkey -M viins '^b' up-line-or-history
bindkey -M viins '^p' up-line-or-history
bindkey -M viins '^f' down-line-or-history
bindkey -M viins '^n' down-line-or-history

export EDITOR='vim'
export VISUAL='vim'

SAVEHIST=1000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt hist_verify
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt append_history
setopt inc_append_history
setopt share_history

setopt no_flowcontrol

setopt rm_star_wait
setopt list_types
setopt no_auto_name_dirs

alias ..='cd ..'



[ -f ~/.zshrc.local ] && source ~/.zshrc.local 
