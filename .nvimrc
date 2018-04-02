set all&

call plug#begin('~/.config/nvim/plugged')
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim'
Plug 'jiangmiao/auto-pairs' 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Valloric/YouCompleteMe'
Plug 'qpkorr/vim-bufkill'
Plug 'SirVer/ultisnips'
Plug 'Shougo/denite.nvim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'janko-m/vim-test'
Plug 'digitaltoad/vim-pug'
Plug 'mustache/vim-mustache-handlebars'
Plug 'ivalkeen/vim-simpledb' 
Plug 'airblade/vim-gitgutter'
" Plug 'vim-syntastic/syntastic'
call plug#end()

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
" ###########
" VIM-TEST
let test#strategy= "neovim"
let g:test#preserve_screen = 0
" nmap <silent> t<C-l> :TestLast<CR>
" nmap <silent> t<C-g> :TestVisit<CR>
" ###########

autocmd FileType javascript.jsx setlocal commentstring={/*%s*/}


"DEBUG TEMP
"let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
"let $NVIM_NCM_LOG_LEVEL="DEBUG"
"let $NVIM_NCM_MULTI_THREAD=0
"

" SETTINGS
set noequalalways
set autoread
set noswapfile
set expandtab
set tabstop=3
set shiftwidth=3
set autoindent
set smartindent

set clipboard+=unnamedplus
set scrolloff=5
set number
set cursorline
" set gcr=a:blinkon500-blinkwait1000-blinkoff500 
set ignorecase
set noshowmode 
set hidden
set mouse=a
set foldmethod=manual
set path=.,**

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

autocmd FileType pug setlocal shiftwidth=2 tabstop=2
" Sors de l'insert quand focus lost 
" autocmd FocusLost * stopinsert "| wall!
"set termguicolors
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'
let g:airline_extensions = ['denite']
colors dracula 

" IGNORE
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.psd,*.psb     " MacOSX/Linux

" DENITE ############################## 
nnoremap § :Denite buffer -auto-resize<cr>
nnoremap <F1> :Denite help -auto-resize<cr>
nnoremap <F2> :Denite register -auto-resize<cr>
nnoremap <M-S-p> :Denite grep<cr>
" nnoremap § :call denite#start([
" \ {'name': 'buffer', 'args': []}])<cr>
nnoremap <C-p> :Denite file_rec -auto-highlight<cr>
" nnoremap <C-p> :call denite#start([
" \ {'name': 'file_rec', 'args': []}])<cr>
"
call denite#custom#source(
         \ 'file_rec', 'sorters', ['sorter_sublime'])

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
         \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#var('file_rec', 'command',
         \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#var(
         \ 'buffer',
         \ 'date_format', '')

call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
         \ [ '.git/', '.ropeproject/', '__pycache__/',
         \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
         \   'static/', 'coverage/'])

" #####################################"
" MAPS
nnoremap <C-e> <NOP>
inoremap <C-e> <NOP>
vnoremap <C-e> <NOP>
let g:mapleader = ","
let g:user_emmet_leader_key='<C-e>'
nnoremap <M-s> :w<cr>
inoremap <M-s> <Esc>:w<cr>a
nnoremap <C-y> <C-x>
nnoremap <C-x> <C-a>
noremap <C-a> :Commentary<CR>j
nnoremap - :Ex<CR>
tnoremap <Esc> <C-\><C-n>

nnoremap tn  :tabnew<Space>
nnoremap tk  <C-W>k
nnoremap tj  <C-W>j
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tq  :BD<CR>
map <F5> mzgg=G`z
nnoremap <F6> :YcmCompleter GoTo<cr>
nnoremap <F7> :YcmCompleter GoToReferences<cr>
nnoremap <F12> :so ~/.config/nvim/init.vim<cr>

nmap <silent> <F9> :TestNearest<CR>
nmap <silent> <F10> :TestFile<CR>
nmap <silent> <F11> :TestSuite<CR>

" ULTISNIPSSSSSSSSSS  AND YCMMMMMMMMMMMMMMM
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]
" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
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
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_global_ycm_extra_conf = '/usr/share/vim/vimfiles/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_filepath_completion_use_working_dir = 0
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 3
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0

" COLORS  Override
" hi Normal ctermfg=White ctermbg=Black
" set background=dark
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE 
hi CursorLine ctermfg=NONE ctermbg=232 cterm=NONE 
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline 
hi Pmenu ctermbg=17 ctermfg=15 gui=bold
hi TabLineFill ctermfg=234 ctermbg=NONE
hi TabLine cterm=none ctermfg=Blue ctermbg=234
hi TabLineSel ctermfg=Red ctermbg=NONE
" hi Comment ctermfg=242 ctermbg=NONE cterm=NONE 


" STARTIFY 
let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_remove_lines = ['vim-simpledb-result.txt']
"let g:startify_list_order = [ 'sessions', 'files', 'dir', 'bookmarks', 'commands']
let g:startify_list_order = [
         \ ['  Sessions'],
         \ 'sessions',
         \ ['These are my bookmarks:'],
         \ 'bookmarks',
         \ ['Fichiers utilisés dans ce répertoire'],
         \ 'dir',
         \ ['These are my commands:'],
         \ 'commands',
         \ ]

let g:startify_bookmarks = [
         \ { 'c': '~/.config/nvim/init.vim' },
         \ { 'z': '~/.zshrc' },
         \ ]
let g:startify_change_to_dir = 0
let g:startify_relative_path = 0
"let g:startify_skiplist = [ 'filebeagle.*']


