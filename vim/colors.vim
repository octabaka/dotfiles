" COLORS "
"
set termguicolors
"set t_Co=256       " Use 256 colors

set background=dark
" let g:afterglow_blackout=1
" let g:afterglow_inherit_background=1

let g:dracula_bold = 1

hi Normal ctermfg=NONE ctermbg=black guibg=#121212
hi CursorLine ctermfg=NONE ctermbg=238 guibg=#001010 cterm=NONE 
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline  guibg=lightred
" hi Pmenu ctermbg=17 ctermfg=15 gui=bold
hi TabLineFill ctermfg=234 ctermbg=NONE
hi TabLine cterm=none ctermfg=Blue ctermbg=234
hi TabLineSel ctermfg=Red ctermbg=NONE
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=232
hi MatchParen ctermfg=NONE ctermbg=89 
hi Comment ctermfg=238 ctermbg=NONE cterm=italic guifg=#003535


"" Nom du Tag: ouverture 
hi tsxTagName ctermfg=lightblue
hi tsxTag ctermfg=lightblue guifg=lightblue
" Fermeture 
hi tsxCloseString ctermfg=blue 
hi tsxCloseTag guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" Attributes 
hi tsxAttrib ctermfg=darkmagenta cterm=italic
"
" Generics 
hi tsxTypeBraces guifg=#999999
hi tsxTypes guifg=#666666
"

colors palenight 
" colors dracula 
hi Comment ctermfg=238 ctermbg=NONE cterm=italic guifg=#353535
hi CursorLine ctermfg=NONE ctermbg=238 guibg=#001010 cterm=NONE 
hi Normal ctermfg=NONE ctermbg=black guibg=#141414
hi tsxTypes ctermfg=193



" AIRLINE "
let g:airline_powerline_fonts = 1
" let g:airline_theme='jellybeans'
let g:airline_theme='afterglow'
let g:airline_extensions = ['denite']

"\ 'colorscheme': 'wombat',
" \[ 'readonly', 'filename', 'modified', 'method' ] ]
let g:lightline = {
 \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
			\   'method': 'NearestMethodOrFunction',
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

