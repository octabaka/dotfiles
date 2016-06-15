" OPTIONS
set autoread
let mapleader = ","
let g:mapleader = ","
set number
set ruler
set ignorecase
set incsearch
syntax enable
set t_Co=256
set encoding=utf8
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set autowriteall
set laststatus=2

set splitbelow
set splitright
set nospell
set so=7
set wildmenu
set hid
set ignorecase
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
"Remember info about open buffers
set viminfo^=%

"---------------------------------- KEEEEYYYSS ----------------------
let mapleader = ','
"set notimeout

nmap <leader>fv :tabedit $MYVIMRC<cr>
map <leader>b :NERDTreeToggle<CR>
map 0 ^
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h
nmap <leader>h :Dash<cr>
nmap <C-T> :CtrlPBufTag<cr>
"nmap <leader>f :CtrlPMRUFiles<cr>
map <leader>s :w<cr>
nnoremap <space> i<space><esc> 
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>
" BACKSPACE SHIT
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set relativenumber


"-------------- AUTO COMMANDS ----------------------
augroup autosourcing
    autocmd!
    autocmd BufWritePost .vimrc source %
augroup END

"----------------------------------VUNDLE ---------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-vinegar'
Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'evidens/vim-twig'
Plugin 'tpope/vim-surround'
Plugin 'wincent/terminus' "Better integration
Plugin 'Valloric/MatchTagAlways'
Plugin 'Yggdroot/indentLine'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'

Bundle 'quanganhdo/grb256'

"THEMES
"Plugin 'dracula/vim'
"Plugin 'tomasr/molokai'
"Plugin 'owickstrom/vim-colors-paramount'
"Plugin 'trusktr/seti.vim'
 "The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

colors grb256 
"let g:molokai_original = 1
"set background=dark
let g:rehash256 = 1
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" PLUGINS OPTIONS AND POST OPTIONS
"
"
set hlsearch
"set timeoutlen=1000       " Mapping delays ?llakdjfpoiu
"set ttimeoutlen=2000      " Key Code Delays ?

"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_match_window = 'min:1,max:20,results:20'

noremap <C-a> :call NERDComment(0,"toggle")<cr>

let g:multi_cursor_use_default_mapping=2
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'
let g:netrw_liststyle= 3 " Meilleur browser style VINAEGERHRHHRRHRRH -
set wildignore+=*.o,*~,*.pyc,*/node_modules/*,*/app/cache/*,*/vendor/*,*/.git/*,.DS_Store


"TIPS AND TRICKS
"
"
" ZZ Pour centrer le curseur au milieu

"
"  Marks
"
"  mM set mark everywhere
"
"  'm

" FOLDS
" zi	switch folding on or off
" za	toggle current fold open/closed
" zc	close current fold
" zR	open all folds
" zM	close all folds
" zv	expand folds to reveal cursor

" VINEGAR
" d   crée un dossier
" D   éfface un dossier
" %  new file? 
"
" SELECTION
" vi'   sélectionne en mode visuel dans les '
" va'   séléctionne avec les '
