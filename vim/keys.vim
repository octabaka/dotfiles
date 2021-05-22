set timeout
set timeoutlen=400
" set ttimeout
" set ttimeoutlen=200
"
" Meta keys
exec "set <M-f>=\ef"
exec "set <M-s>=\es"


let g:mapleader = "\<Space>"
let g:maplocalleader = ','

nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" BINDS FZF  ###############################

nnoremap <C-p> :Files<cr>
nnoremap <M-f> :Rg<cr>
nnoremap <nowait> <leader><space> :Buffers!<cr>

" cnoremap <expr> <A-h> &cedit. 'h' .'<C-c>'
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>
" cnoremap <expr> <A-l> &cedit. 'l' .'<C-c>'
nnoremap - :Lf<cr>
nnoremap <leader>c :lcd %:p:h<enter>
" Essential
inoremap <nowait> § <Esc>
nnoremap <nowait> § <Esc>
" noremap <C-a> :Commentary<CR>
" map <F5> mzgg=G`z
noremap <F5> :Format<cr>
nnoremap <leader>f :Format<cr>
nnoremap <M-s> :w<cr>
inoremap <M-s> <esc>:w<cr><esc>
" nnoremap <nowait> <leader>s :w<cr>

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
" nnoremap q :bwipeout<cr>
"
"BCLOSE
" command! -bang -complete=buffer -nargs=? Bclose Bdelete<bang> <args>
nnoremap q :Bclose!<cr>

"Pum (Popup) keys
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" load conf
nnoremap <leader>rv :so ~/devops/dotfiles/vim/init.vim<cr>
" show colors
nnoremap <leader>tc :runtime syntax/colortest.vim<CR>
" Other
nnoremap <Leader>pp :Startify<cr>
nnoremap <Leader>i <c-a>
nnoremap <Leader>d <c-x>

nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>sc :set invlist<CR>

nnoremap <F11> :!pio run --target upload<cr>


" TERMINAL
" au TerminalWinOpen * setlocal bufhidden=hide
au TerminalWinOpen * setlocal nobuflisted
" function! HiddenTerminal()
"   :terminal
"   set nobuflisted
" endfunction

" command! HiddenTerminal call HiddenTerminal()
" nnoremap <leader>bb :HiddenTerminal<CR>


