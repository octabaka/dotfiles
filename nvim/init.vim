call plug#begin('~/.vim/plugged')
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'itchyny/lightline.vim'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-abolish'

Plug 'rbgrouleff/bclose.vim'

Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }



" other
Plug 'liuchengxu/vim-which-key'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'skywind3000/vim-keysound'
"
" DEV
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'mattn/emmet-vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" sql rest
Plug 'NLKNguyen/pipe.vim' "required
Plug 'NLKNguyen/pipe-mysql.vim'
Plug 'diepm/vim-rest-console'

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


call plug#end()


let s:my_path='~/.config/nvim/'

exec 'source ' . s:my_path . 'essentials.vim'
exec 'source ' . s:my_path . 'colors.vim'
exec 'source ' . s:my_path . 'dev.vim'
exec 'source ' . s:my_path . 'others.vim'
exec 'source ' . s:my_path . 'keys.vim'



