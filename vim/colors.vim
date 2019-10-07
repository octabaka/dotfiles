" COLORS "
"
set termguicolors
"set t_Co=256       " Use 256 colors

set background=dark
colors dracula
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

