" COLORS "
"
" set termguicolors
set t_Co=256       " Use 256 colors

" set background=dark


" AIRLINE "
let g:airline_powerline_fonts = 1
" let g:airline_theme='jellybeans'
let g:airline_theme='afterglow'
let g:airline_extensions = ['denite']

" \[ 'readonly', 'filename', 'modified', 'method' ] ]
let g:lightline = {
 \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'absolutepath', 'modified', 'method' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
			\   'method': 'NearestMethodOrFunction',
      \ },
      \ }

function! LightLineFilename()
	let name = ""
	let subs = split(expand('%'), "/")
	let i = 1
	for s in subs
		let parent = name
		if  i == len(subs)
			let name = parent . '/' . s
		elseif i == 1
			let name = s
		else
			let name = parent . '/' . strpart(s, 0, 2)
		endif
		let i += 1
	endfor
  return name
endfunction

" function! LightlineFilename()
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let path = expand('%:p')
"   if path[:len(root)-1] ==# root
"     return path[len(root)+1:]
"   endif
"   return expand('%')
" endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0


" ###################################### COLORS #################################
" let g:afterglow_blackout=1
" let g:afterglow_inherit_background=1
let g:dracula_bold = 1
" colors one
" colors palenight 
" colors dracula
colors onehalfdark
hi Comment ctermfg=237 ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=233 cterm=NONE 
hi CursorLineNr ctermfg=250 ctermbg=234 cterm=bold 
hi Normal ctermfg=NONE ctermbg=233
hi LineNr ctermfg=237 ctermbg=black
hi clear SignColumn
hi IncSearch ctermfg=233 ctermbg=24 cterm=NONE 
hi Search ctermfg=NONE ctermbg=NONE cterm=underline  guibg=lightred
hi TabLineSel ctermfg=Red ctermbg=NONE
hi TabLine cterm=none ctermfg=Blue ctermbg=234
hi TabLineFill cterm=none ctermfg=NONE ctermbg=234
" hi Title ctermfg=LightBlue ctermbg=Magenta

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0

hi IndentGuidesOdd  ctermbg=233
hi IndentGuidesEven ctermbg=234
hi MatchParen ctermfg=NONE ctermbg=89 

hi Pmenu ctermfg=245 ctermbg=234


"" Nom du Tag: ouverture 
" hi tsxTagName ctermfg=lightblue
" hi tsxTag ctermfg=lightblue guifg=lightblue
" " Fermeture 
" hi tsxCloseString ctermfg=blue 
" hi tsxCloseTag guifg=#F99575
" hi tsxAttributeBraces guifg=#F99575
" hi tsxEqual guifg=#F99575

" Attributes 
" hi tsxAttrib ctermfg=darkmagenta cterm=italic
"
" Generics 
" hi tsxTypeBraces guifg=#999999
" hi tsxTypes guifg=#666666
"
