call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
Plug 'cloudhead/neovim-fuzzy'
Plug 'mattn/emmet-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
call plug#end()

let g:AutoPairsCenterLine = 0
"set termguicolors
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0 
let g:airline_theme='luna'
"let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file' ]
let g:airline#extensions#whitespace#enabled = 0
colors dracula 

set path=.,**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set expandtab
set tabstop=4
set shiftwidth=4
set clipboard+=unnamedplus
set scrolloff=3
set relativenumber
set cursorline
set gcr=a:blinkon500-blinkwait500-blinkoff500 
set ignorecase
set noshowmode 
set hidden

autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 



noremap <C-a> :call NERDComment(0,"toggle")<cr>
noremap <C-p> :FuzzyOpen<CR>
nnoremap - :Ex<CR>

let g:deoplete#enable_at_startup = 1



