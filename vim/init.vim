scriptencoding utf-8

set shell=/bin/bash

call plug#begin('~/.vim/plugged')

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'itchyny/lightline.vim'

Plug 'suy/vim-context-commentstring'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'

Plug 'rbgrouleff/bclose.vim'

Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'mbbill/undotree'
" Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-abolish'

" DEV
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" WEB
Plug 'mattn/emmet-vim'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" sql rest
Plug 'NLKNguyen/pipe.vim' "required
Plug 'NLKNguyen/pipe-mysql.vim'
Plug 'diepm/vim-rest-console'


Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'


" Syntaxes 
Plug 'hashivim/vim-hashicorp-tools'
Plug 'chase/vim-ansible-yaml'
" Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'mustache/vim-mustache-handlebars'
Plug 'jparise/vim-graphql'
Plug 'chr4/nginx.vim'
Plug 'jvirtanen/vim-hcl'
Plug 'cespare/vim-toml'
Plug 'wgwoods/vim-systemd-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


" other
Plug 'liuchengxu/vim-which-key'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'skywind3000/vim-keysound'

call plug#end()

" let s:my_path=$HOME.'/devops/dotfiles/vim/'
let s:my_path='/home/octa/devops/dotfiles/vim/'

exec 'source ' . s:my_path . 'essentials.vim'
exec 'source ' . s:my_path . 'dev.vim'
exec 'source ' . s:my_path . 'colors.vim'
exec 'source ' . s:my_path . 'others.vim'
exec 'source ' . s:my_path . 'keys.vim'
if filereadable('/home/octa/.vimrc.local')
	exec 'source /home/octa/.vimrc.local'
endif


