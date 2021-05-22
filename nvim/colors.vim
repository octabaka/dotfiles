" COLORS "
"
" set termguicolors
set t_Co=256       " Use 256 colors
" set background=dark
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
" let g:lightline.colorscheme='onehalfdark'
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
"
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
