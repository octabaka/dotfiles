scriptencoding utf-8

set shell=/bin/bash

call plug#begin('~/.vim/plugged')
 " Plug 'vim-airline/vim-airline'
 " Plug 'vim-airline/vim-airline-themes'
 Plug 'itchyny/lightline.vim'
 Plug 'dracula/vim'
 Plug 'danilo-augusto/vim-afterglow'
 Plug 'drewtempelmeyer/palenight.vim'

 " Plug 'roxma/nvim-yarp'
 " Plug 'roxma/vim-hug-neovim-rpc'
 " Plug 'Shougo/denite.nvim'
 Plug 'suy/vim-context-commentstring'
 " Plug 'liuchengxu/vim-clap'

 " Plug 'Shougo/vimproc.vim', {'do' : 'make'}
 " Plug 'Shougo/echodoc.vim'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 " Plug 'tpope/vim-eunuch'
 " Plug 'tpope/vim-vinegar'
 Plug 'justinmk/vim-dirvish'
 " Plug 'jiangmiao/auto-pairs' 
 Plug 'liuchengxu/vista.vim'
 " Plug 'markonm/traces.vim'
 Plug 'tpope/vim-fugitive'
 Plug 'mhinz/vim-startify'
 Plug 'tpope/vim-obsession'
 Plug 'tpope/vim-abolish'

 " WEB
 " Plug 'HerringtonDarkholme/yats.vim'
 Plug 'leafgarland/typescript-vim'
 Plug 'peitalin/vim-jsx-typescript'
 Plug 'evanleck/vim-svelte'
 " Plug 'maxmellon/vim-jsx-pretty'
 Plug 'mattn/emmet-vim'
 Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
 Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
 Plug 'NLKNguyen/pipe.vim' "required
 Plug 'NLKNguyen/pipe-mysql.vim'

 " Plug 'skywind3000/vim-keysound'

" Syntax 
"
 Plug 'chase/vim-ansible-yaml'
 Plug 'Glench/Vim-Jinja2-Syntax'
 Plug 'jparise/vim-graphql'

 " Plug 'wakatime/vim-wakatime'
 " Plug 'dhruvasagar/vim-buffer-history'

call plug#end()

" let s:my_path=$HOME.'/devops/dotfiles/vim/'
let s:my_path='/home/octa/devops/dotfiles/vim/'

exec "source " . s:my_path . "essentials.vim"
" exec "source " . s:my_path . "denite.vim"
exec "source " . s:my_path . "dev.vim"
exec "source " . s:my_path . "colors.vim"
exec "source " . s:my_path . "others.vim"
if filereadable("/home/octa/.vimrc.local")
	exec "source /home/octa/.vimrc.local"
endif


































