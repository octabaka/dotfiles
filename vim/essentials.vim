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
set expandtab
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
set clipboard=unnamedplus
" set switchbuf=usetab,newtab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.
set switchbuf=usetab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.

set t_ut=
" set t_te=

set winminheight=0
" set wildmode=list:longest,full
set wildmode=longest,list,full
set listchars=tab:???\ ,eol:???,trail:??,extends:???,precedes:???

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

set termencoding=utf-8
set fileencoding=utf-8
set nobackup
set noswapfile
set nowritebackup

set foldmethod=manual

set wildignore+=*/node_modules/*,*/.git/*,*.min.js,*.min.css

set noshowmode
set sessionoptions-=options " disable options from sessions

set termwinsize=8x0

" cursor
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END


" NETRW"
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=4
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0
let g:netrw_keepdir=0
let g:netrw_winsize = 18
" let g:netrw_browse_split = 4



"

" Explorer netrw ranger etc...
" map - <Nop>
" let g:NERDTreeHijackNetrw = 0 " add this line if you use NERDTree
" let g:ranger_replace_netrw = 1 " open ranger when vim open a directory
" let g:ranger_map_keys = 0
" function! Lf(path)
"     let temp = tempname()
"     exec 'silent !lf -selection-path=' . shellescape(temp) 
"     if !filereadable(temp)
"         redraw!
"         return
"     endif
"     let names = readfile(temp)
"     if empty(names)
"         redraw!
"         return
"     endif
"     exec 'edit ' . fnameescape(names[0])
"     for name in names[1:]
"         exec 'argadd ' . fnameescape(name)
"     endfor
"     redraw!
" endfunction

" function! OpenLfIn(path)
"   let currentPath = shellescape(isdirectory(a:path) ? fnamemodify(expand(a:path), ":p:h") : expand(a:path))
" 	" exec "set path+=".currentPath
" 	" exec 'lcd' fnameescape(currentPath)
"   exec 'silent !lf' . ' ' . currentPath
"   redraw!
" endfun
" ##############
let g:floaterm_position = 'center'
let g:floaterm_width = 100
let g:floaterm_height = 30
" let g:floaterm_borderchars = '        '
let g:floaterm_title = ''

let g:lf_map_keys = 0
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
" ##############

" augroup ReplaceNetrwByLfVim
"   autocmd VimEnter * silent! autocmd! FileExplorer
"   autocmd BufEnter * let s:buf_path = expand("%") | if isdirectory(s:buf_path) | bdelete! | call timer_start(100, {->OpenLfIn(s:buf_path)}) | endif
" augroup END

" nnoremap - :RangerCurrentDirectory<cr> 

" augroup netrw_mapping
" 	autocmd!
" 	autocmd filetype netrw call NetrwMapping()
" augroup END

function! NetrwMapping()
	" nnoremap <buffer> tl :BufferHistoryForward<cr>
	" nnoremap <buffer> th :BufferHistoryBack<cr>
	nnoremap <buffer> l <enter>
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


" Dirvish
" let g:dirvish_mode = ':sort ,^.*[\/],'
" augroup dirvish_config
"       autocmd!
"       autocmd FileType dirvish silent! nnoremap <buffer> <nowait> q :bwipeout<cr>
"       " autocmd FileType dirvish silent! nnoremap <buffer> <C-p> :CocList files<cr>
" 			autocmd FileType dirvish silent! unmap <buffer> <C-p>
" 			" autocmd FileType dirvish silent! unmap <buffer> l 
"       " autocmd FileType dirvish silent! nnoremap <buffer> l <enter> 
" augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

" .conf files
" autocmd BufRead,BufNewFile *.conf setf dosini


let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_folding_disabled = 1


