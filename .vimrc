" OPTIONS
set clipboard=unnamed
set autoread
"set autochdir
set number
set noruler
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
"set lbr
"set tw=500

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

set autowriteall
set laststatus=2

set splitbelow
set splitright
set nospell
set so=7
set wildmode=longest,full,full
"set wildmode=list:longest,full
set completeopt=longest,menuone
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

" BACKSPACE SHIT
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set noerrorbells
set novisualbell
set t_vb=
set hlsearch
"set timeoutlen=1000       " Mapping delays ?llakdjfpoiu
"set ttimeoutlen=2000      " Key Code Delays ?
set relativenumber
"set undofile " UNDOS
"set undodir=~/.vim/undodir
"INDENT
au FileType scss setl sw=2 sts=2 et


" DISABLE NETRW ?
let loaded_netrwPlugin = 1


"-------------- AUTO COMMANDS ----------------------
"augroup autosourcing
    "autocmd!
    "autocmd BufWritePost .vimrc nested source %
"augroup END

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END



autocmd BufNewFile,BufRead *.volt   set syntax=jinja
autocmd BufNewFile,BufRead *.volt   set filetype=jinja

"----------------------------------VUNDLE ---------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'evidens/vim-twig'
Plugin 'tpope/vim-surround'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mhinz/vim-startify'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'mattn/emmet-vim'
Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'Syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'stephpy/vim-yaml'

if has("macunix")
    Plugin 'wincent/terminus' "Better integration Iterm OSX Only !!
    Plugin 'rizzatti/dash.vim' " Doc OSX
endif

if has("python")
    Plugin 'Valloric/MatchTagAlways' "REQUIRES PYTHON :echo has('python')
    "Plugin 'Valloric/YouCompleteMe' "REQUIRES cd .vim/bundle/install.py --system-boost --tern-completer
endif


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" PLUGINS & KEY
let g:hybrid_custom_term_colors = 1

colors octa

set background=dark
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0 " Buffer tabs en haut
let g:airline_theme='luna'
"let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#enabled = 0
let g:rehash256 = 1
"let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_match_window = 'min:1,max:20,results:20'
" matchtag
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \}
" Indent Char
"let g:indentLine_leadingSpaceEnabled=0
"let g:indentLine_char = '│'
"let g:indentLine_color_term = 239

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 80
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']
let g:indent_guides_default_mapping = 0
"let g:indent_guides_guide_size = 1
"let g:indent_guides_start_level = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=233


let g:multi_cursor_use_default_mapping=2
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-d>'
"let g:netrw_liststyle= 3 " Meilleur browser style VINAEGERHRHHRRHRRH -
set wildignore+=*.o,*~,*.pyc,*/node_modules/*,*/app/cache/*,*/vendor/*,*/.git/*,.DS_Store
"let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

"if executable('ag')
"      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"endif
" NERD COMMENT
let g:NERDAltDelims_jinja = 1

let g:syntastic_javascript_checkers=['']
let g:syntastic_enable_signs = 0
let g:syntastic_scss_checkers=['scss_lint']
"sass scss_lint

let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_remove_lines = ['filebeagle']
"let g:startify_list_order = [ 'sessions', 'files', 'dir', 'bookmarks', 'commands']
let g:startify_list_order = [
            \ ['  Sessions'],
            \ 'sessions',
            \ ['Fichiers utilisés dans ce répertoire'],
            \ 'dir',
            \ ['Fichiers les plus utilisés tout partout'],
            \ 'files',
            \ ['These are my bookmarks:'],
            \ 'bookmarks',
            \ ['These are my commands:'],
            \ 'commands',
            \ ]

let g:startify_change_to_dir = 0
let g:startify_relative_path = 0
"let g:startify_skiplist = [ 'filebeagle.*']
" ------- 
let mapleader = ","
let g:mapleader = ","
"<nop> = no operation ^_^
let g:filebeagle_suppress_keymaps = 1
map <silent> -          <Plug>FileBeagleOpenCurrentBufferDir


if has("macunix")
    let g:ycm_python_binary_path = '/usr/local/bin/python3'
endif

" jk pour escape le mode insert?!
"inoremap jk <esc>
"inoremap <esc> <nop>
"inoremap <C-c> <nop>
" ----------------------- Î
" Emmet
let g:user_emmet_leader_key='<C-e>' 
noremap <C-a> :call NERDComment(0,"toggle")<cr>
nnoremap <leader>ev :tabedit $MYVIMRC<cr>
nnoremap <leader>eg :tabedit ./gulpfile.js<cr>
nnoremap <leader>ep :tabedit ./package.json<cr>
"nnoremap - :NERDTreeToggle<CR>
nnoremap 0 ^
nnoremap q q <Nop>
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
if has("macunix")
    nnoremap <leader>h :Dash<cr>
endif
nnoremap <C-T> :CtrlPBufTag<cr>
"nmap <leader>f :CtrlPMRUFiles<cr>
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlPCurWD'
"let g:ctrlp_working_path_mode = ''
nnoremap § :CtrlPBuffer<cr>
nnoremap <leader>s :w<cr>
"nnoremap <space> i<space><esc>
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<cr>
nnoremap th :tabprev<cr>

cmap w!! w !sudo tee >/dev/null %

"
"TIPS AND TRICKS
"
" s   <--- pour effacer le char et insert mode
" ZZ Pour centrer le curseur au milieu

"
"  Marks
"
"  mM set mark everywhere
"
"  'm

" FOLDS
set foldmethod=indent
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
" vip   séléctionne paragraphe
" vit   séléctionne dans les tags !!!!
"
" NAVIGATION
"  %   va vers le bracket correspondant
" C-o previous location
" C-i next location
" f<char> bouge curseur to char
"
" REGISTERS
" "*p colle le registre système
" "0 avant dernier registre !!
