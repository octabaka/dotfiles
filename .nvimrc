call plug#begin('~/.config/nvim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs' 
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe'
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips'
Plug 'mhinz/vim-startify'

call plug#end()

"let g:ycm_server_python_interpreter = '/usr/bin/python2'
"let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"DEBUG TEMP
"let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
"let $NVIM_NCM_LOG_LEVEL="DEBUG"
"let $NVIM_NCM_MULTI_THREAD=0
"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" SETTINGS
set noequalalways
set autoread
set noswapfile
set expandtab
set tabstop=8
set shiftwidth=4
set autoindent
set smartindent

set clipboard+=unnamedplus
set scrolloff=6
set number
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
" Sors de l'insert quand focus lost !
autocmd FocusLost * stopinsert "| wall!
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
"let g:AutoPairsCenterLine = 0
"let g:AutoPairsShortcutFastWrap='<C-M>' "BUG ENTER

" MAPS
let g:mapleader = ","
nnoremap <M-s> :w<cr>
inoremap <M-s> <Esc>:w<cr>a
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
noremap <C-a> :call NERDComment(0,"toggle")<cr>
noremap <C-p> :FuzzyOpen<CR>
nnoremap - :Ex<CR>
let g:user_emmet_leader_key='<C-E>'
tnoremap <Esc> <C-\><C-n>

nnoremap tn  :tabnew<Space>
nnoremap tk  <C-W>k
nnoremap tj  <C-W>j
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
"nnoremap tq  :bp\|bd \#<CR>
nnoremap tq  :BD<CR>
map <F7> mzgg=G`z

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" COLORS  Override
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline 
hi Pmenu ctermbg=17 ctermfg=15 gui=bold
hi TabLineFill ctermfg=234 ctermbg=NONE
hi TabLine cterm=none ctermfg=Blue ctermbg=234
hi TabLineSel ctermfg=Red ctermbg=NONE


" STARTIFY 
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
