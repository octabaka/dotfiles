call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
"Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'mxw/vim-jsx'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/deoppet.nvim', { 'do': ':UpdateRemotePlugins' } "TODO En développement

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 0

" SETTINGS
set expandtab
set tabstop=8
set shiftwidth=4
set autoindent
set smartindent
map <F7> mzgg=G`z

set clipboard+=unnamedplus
set scrolloff=6
set relativenumber
set cursorline
"set gcr=a:blinkon500-blinkwait1000-blinkoff500 
set ignorecase
set noshowmode 
set hidden
set mouse=a
let g:netrw_banner=0
"let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 1
let g:netrw_winsize = 30

" Retour à la dernière ligne quand on réouvre un fichier
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 

"set termguicolors
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
let g:airline_extensions = ['ctrlp']
colors dracula 

" IGNORE
set path=.,**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.psd,*.psb     " MacOSX/Linux
" IGNORE CTRLP
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules|DECOUPE)$',
            \ 'file': '\v\.(exe|so|dll|psd|psb|jpg|png|ico|png\~)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

"AUTO PAIRS
let g:AutoPairsCenterLine = 0
"let g:AutoPairsShortcutFastWrap='<C-M>' "BUG ENTER

" MAPS
let g:mapleader = ","
nnoremap <M-s> :w<cr>
inoremap <M-s> <Esc>:w<cr>a
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
noremap <C-a> :call NERDComment(0,"toggle")<cr>
noremap <C-p> :FuzzyOpen<CR>
nnoremap - :Ex<CR>
let g:user_emmet_leader_key='<C-E>'
tnoremap <Esc> <C-\><C-n>

" COLORS  Override
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline 

" TEMPLATES
nnoremap <leader>comp :-1read $HOME/.config/nvim/templates/rcomponent.jsx<CR>
nnoremap <leader>t :-1read $HOME/.config/nvim/templates/

