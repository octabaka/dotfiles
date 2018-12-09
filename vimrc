scriptencoding utf-8

call plug#begin('~/.vim/plugged')
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'dracula/vim'
 Plug 'qpkorr/vim-bufkill'
 Plug 'Shougo/denite.nvim'
 Plug 'tpope/vim-commentary'
 Plug 'tpope/vim-surround'
 Plug 'tpope/vim-repeat'
 Plug 'mhinz/vim-startify'
 Plug 'chase/vim-ansible-yaml'
 Plug 'Glench/Vim-Jinja2-Syntax'
 Plug 'Valloric/YouCompleteMe'
 Plug 'leafgarland/typescript-vim'
 Plug 'mattn/emmet-vim'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'tpope/vim-vinegar'

 let g:ansible_options = {'ignore_blank_lines': 0}
 " Plug 'luochen1990/indent-detector.vim'
call plug#end()

let mapleader = " "

set nocompatible

syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types
set autoindent                 " Indent at the same level of the previous line
set autoread                   " Automatically read a file changed outside of vim
set backspace=indent,eol,start " Backspace for dummies
set complete-=i                " Exclude files completion
set display=lastline           " Show as much as possible of the last line
set encoding=utf-8             " Set default encoding
set history=10000              " Maximum history record
set hlsearch                   " Highlight search terms
set incsearch                  " Find as you type search
set laststatus=2               " Always show status line
set mouse=a                    " Automatically enable mouse usage
set smarttab                   " Smart tab
set ttyfast                    " Faster redrawing
set viminfo+=!                 " Viminfo include !
set wildmenu                   " Show list instead of just completing
set ttymouse=xterm2
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase     " Case insensitive search
set smartcase      " ... but case sensitive when uc present
"set scrolljump=5   " Line to scroll when cursor leaves screen
set scrolloff=3    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set shiftwidth=2   " Use indents of 4 spaces
set tabstop=2      " An indentation every four columns
" set softtabstop=0  " Let backspace delete indent
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
set autowrite      " Automatically write a file when leaving a modified buffer
set mousehide      " Hide the mouse cursor while typing
set hidden         " Allow buffer switching without saving
set t_Co=256       " Use 256 colors
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen
set number relativenumber
set cursorline 
set clipboard=unnamedplus
:set switchbuf=usetab,newtab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.

set t_ut=

set winminheight=0
" set wildmode=list:longest,full
set wildmode=longest,list,full
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

set termencoding=utf-8
set fileencoding=utf-8
set nobackup
set noswapfile
set nowritebackup

" COLORS "
colors dracula
" let g:dracula_bold = 1
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE 
hi CursorLine ctermfg=NONE ctermbg=232 cterm=NONE 
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline 
hi Pmenu ctermbg=17 ctermfg=15 gui=bold
hi TabLineFill ctermfg=234 ctermbg=NONE
hi TabLine cterm=none ctermfg=Blue ctermbg=234
hi TabLineSel ctermfg=Red ctermbg=NONE
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=232
hi MatchParen ctermfg=NONE ctermbg=89 
hi Comment ctermfg=238 ctermbg=NONE cterm=italic 

" AIRLINE "
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
let g:airline_extensions = ['denite']

" NETRW"
" let g:netrw_banner=0
" let g:netrw_altv=1
" let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_preview = 1
" let g:netrw_winsize = 18
" " let g:netrw_browse_split = 4
" augroup netrw_mapping
"     autocmd!
"     autocmd filetype netrw call NetrwMapping()
" augroup END

" function! NetrwMapping()
"     noremap <buffer> - :q<cr>
" 		noremap <buffer> n t 
" 		noremap <buffer> tn  :tabnew<Space>
" 		noremap <buffer> tk  <C-W>k
" 		noremap <buffer> tj  <C-W>j
" 		noremap <buffer> th  :tabprev<CR>
" endfunction


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" ###### DENITE ############################## 

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
			\ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#source('file_rec', 'sorters', ['sorter_sublime'])
call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var('buffer', 'date_format', '')

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
" call denite#custom#map('insert', '§' , '<denite:quit>', 'noremap')
" call denite#custom#map('normal', '§' , '<denite:quit>', 'noremap')
" call denite#custom#map('insert', '§', '<denite:quit>', 'noremap')
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
			\ [ '.git/', '.ropeproject/', '__pycache__/',
			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
			\   'static/', 'coverage/'])

call denite#custom#map('insert', '<Tab>', '<denite:quit>', 'noremap')

" ###### STARTIFY 
" let g:startify_custom_header =
   " \ map(split(system('taoup-fortune'), '\n'), '"   ". v:val')
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_remove_lines = ['vim-simpledb-result.txt']
let g:startify_list_order = [
         \ ['These are my bookmarks:'],
         \ 'bookmarks',
         \ ['Fichiers utilisés dans ce répertoire'],
         \ 'dir',
         \ ['  Sessions'],
         \ 'sessions',
         \ ['These are my commands:'],
         \ 'commands',
         \ ]

let g:startify_bookmarks = [
         \ { 'c': '~/.config/nvim/init.vim' },
         \ { 'z': '~/.zshrc' },
         \ { 'e': '~/dotfiles/.emacs' },
         \ { 'p': '~/.config/i3/config' },
         \ { 'n': '~/Bureau/blocNote.txt' },
         \ ]
let g:startify_change_to_dir = 0
let g:startify_relative_path = 0

" YCM
" let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 0
" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_min_num_identifier_candidate_chars = 3
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" TS
let g:typescript_indent_disable = 1

" GOLANG"
au BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
let g:go_fmt_autosave = 0
let g:go_fmt_experimental = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" BINGINGS "
let g:user_emmet_leader_key='<C-e>'
noremap <C-a> :Commentary<CR>
" nnoremap - :Lex %:h<CR> 
nnoremap <a-s> :w<cr>
inoremap <a-s> <Esc>:w<cr>
map <F5> mzgg=G`z

nnoremap tn :tabnew<Space>
nnoremap th :tabprev<CR>
nnoremap tj :bn<cr>
nnoremap tk :bp<cr>
nnoremap tl :tabnext<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap tq :BD<CR>

nnoremap <F1> :Denite help -auto-resize<cr>
nnoremap <F2> :Denite register -auto-resize<cr>
nnoremap <C-p> :Denite file_rec -auto-highlight<cr>
nnoremap <tab> :Denite buffer -auto-resize<cr>
nnoremap <leader>p :Denite grep -auto-resize<cr>
nnoremap <leader>l :bn<cr>
nnoremap <leader>h :bp<cr>
nnoremap <leader>q :BD<cr>
inoremap § <Esc>
nnoremap § <Esc>


autocmd BufNewFile,BufRead Vagrantfile set syntax=ruby
