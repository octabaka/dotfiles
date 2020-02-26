let mapleader = "\<Space>"

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
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen
" set number relativenumber
set number 
set cursorline 
set clipboard=unnamed
" set switchbuf=usetab,newtab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.
set switchbuf=usetab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.

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

set foldmethod=manual

set wildignore+=*/node_modules/*,*/.git/*,*.min.js,*.min.css

set noshowmode

" cursor
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END


" NETRW"
" let g:netrw_banner=0
" let g:netrw_altv=1
" let g:netrw_liststyle=3
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
" let g:netrw_preview = 1
" let g:netrw_keepdir=0
" let g:netrw_winsize = 18
" " let g:netrw_browse_split = 4
augroup netrw_mapping
	autocmd!
	autocmd filetype netrw call NetrwMapping()
augroup END

function! NetrwMapping()
	" nnoremap <buffer> tl :BufferHistoryForward<cr>
	" nnoremap <buffer> th :BufferHistoryBack<cr>
	nnoremap <buffer> tl <C-i>
	nnoremap <buffer> th <C-o> 
	nnoremap <buffer> tj <C-w>j
	nnoremap <buffer> tk <C-w>k
	" nnoremap <buffer> - :Ex<cr>
	nnoremap <buffer> <C-h> <C-w>h
	nnoremap <buffer> <C-j> <C-w>j
	nnoremap <buffer> <C-k> <C-w>k
	nnoremap <buffer> <C-l> <C-w>l
  " nnoremap <buffer> <nowait> q :Rexplore<cr>
  nnoremap <buffer> <nowait> q :bd<cr>
endfunction

let g:BufSurfIgnore = '\[denite\]-default,\[BufExplorer\]'

" Dirvish
let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish_config
      autocmd!
      autocmd FileType dirvish silent! nnoremap <buffer> <nowait> q :bwipeout<cr>
      autocmd FileType dirvish silent! nnoremap <buffer> <C-p> :CocList files<cr>
augroup END

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" .conf files
autocmd BufRead,BufNewFile *.conf setf dosini


" fix meta keys automaticaly...
" 97,122
" f = 102 ascii
" for i in range(102,102)
" 	let c = nr2char(i)
" 	exec "map \e".c." <M-".c.">"
" 	exec "map! \e".c." <M-".c.">"
" endfor
" " a
" for i in range(115,115)
" 	let c = nr2char(i)
" 	exec "map \e".c." <M-".c.">"
" 	exec "map! \e".c." <M-".c.">"
" endfor
"
exec "set <M-f>=\ef"
exec "set <M-s>=\es"

set notimeout ttimeout ttimeoutlen=200

" Essential
inoremap <nowait> § <Esc>
nnoremap <nowait> § <Esc>
" noremap <C-a> :Commentary<CR>
" map <F5> mzgg=G`z
noremap <F5> :Format<cr>
nnoremap <M-s> :w<cr>
inoremap <M-s> <esc>:w<cr><esc>
nnoremap <nowait> <leader>s :w<cr>

" Navigation
nnoremap tl <C-i>
nnoremap th <C-o> 
" nnoremap tl :BufferHistoryForward<cr>
" nnoremap th :BufferHistoryBack<cr>
nnoremap tj <C-w>j
nnoremap tk <C-w>k
" nnoremap - :Explore<cr> "vinaegar
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap q :bwipeout<cr>

"Pum (Popup) keys
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" load conf
nnoremap <F12> :so ~/devops/dotfiles/vim/init.vim<cr>
" show colors
nnoremap <leader>tc :runtime syntax/colortest.vim<CR>
" Other
nnoremap <Leader>pp :Startify<cr>
nnoremap <Leader>i <c-a>
nnoremap <Leader>d <c-x>
