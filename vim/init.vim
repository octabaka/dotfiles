scriptencoding utf-8

set shell=/bin/bash

call plug#begin('~/.vim/plugged')
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'dracula/vim'
 Plug 'roxma/nvim-yarp'
 Plug 'roxma/vim-hug-neovim-rpc'
 Plug 'Shougo/denite.nvim'
 " Plug 'liuchengxu/vim-clap'

 " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 " Plug 'Shougo/echodoc.vim'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'tpope/vim-vinegar'
 Plug 'jiangmiao/auto-pairs' 
 Plug 'liuchengxu/vista.vim'
 " Plug 'markonm/traces.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'mhinz/vim-startify'
 Plug 'tpope/vim-obsession'
 Plug 'tpope/vim-abolish'

 " WEB
 " Plug 'peitalin/vim-jsx-typescript'
 " Plug 'HerringtonDarkholme/yats.vim'
 Plug 'leafgarland/typescript-vim'
 Plug 'maxmellon/vim-jsx-pretty'
 Plug 'mattn/emmet-vim'
 Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
 Plug 'suy/vim-context-commentstring'
 Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Syntax 
 Plug 'chase/vim-ansible-yaml'
 Plug 'Glench/Vim-Jinja2-Syntax'
 Plug 'jparise/vim-graphql'




call plug#end()

let s:my_path=$HOME.'/devops/dotfiles/vim/'

exec "source " . s:my_path . "essentials.vim"
exec "source " . s:my_path . "denite.vim"
exec "source " . s:my_path . "dev.vim"
exec "source " . s:my_path . "colors.vim"
exec "source " . s:my_path . "others.vim"


