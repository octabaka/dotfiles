" " ###### DENITE ############################## 
" " " Define mappings
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d
"   \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"   \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space>
"   \ denite#do_map('toggle_select').'j'
" endfunction

" autocmd FileType denite-filter call s:denite_filter_my_settings()
" function! s:denite_filter_my_settings() abort
"   imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
" endfunction

" call denite#custom#var('file/rec', 'command',
" 	\ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" " call denite#custom#source('file/rec', 'sorters', ['sorter_sublime'])
" call denite#custom#source(
" 	\ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
" " call denite#custom#source(
" " 	\ 'file/rec', 'matchers', ['matcher/cpsm'])

" 	" Change sorters.
" 	call denite#custom#source(
" 	\ 'file/rec', 'sorters', ['sorter/sublime'])

" 	" Change default action.
" 	call denite#custom#kind('file', 'default_action', 'split')

" " call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" call denite#custom#var('buffer', 'date_format', '')

" " call denite#custom#map('insert', '<C-j>', '<denite:move_to_next_line>', 'noremap')
" " call denite#custom#map('insert', '<C-k>', '<denite:move_to_previous_line>', 'noremap')
" " call denite#custom#map('insert', '<Tab>', '<denite:quit>', 'noremap')
" " call denite#custom#map('insert', '§' , '<denite:quit>', 'noremap')
" " call denite#custom#map('normal', '§' , '<denite:quit>', 'noremap')
" " call denite#custom#map('insert', '§', '<denite:quit>', 'noremap')
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
" 			\ [ '.git/', '.ropeproject/', '__pycache__/',
" 			\   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
" 			\   'static/', 'coverage/'])


" let s:denite_options = {'default' : {
"  \ 'split': 'floating',
"  \ 'start_filter': 1,
"  \ 'auto_resize': 1,
"  \ 'source_names': 'short',
"  \ 'prompt': 'λ:',
"  \ 'statusline': 0,
"  \ 'highlight_matched_range': 'Visual',
"  \ 'highlight_window_background': 'Visual',
"  \ 'highlight_filter_background': 'StatusLine',
"  \ 'highlight_prompt': 'StatusLine',
"  \ 'highlight_matched_char': 'NONE',
"  \ 'winrow': 1,
"  \ 'vertical_preview': 1
"  \ }}
" " Loop through denite options and enable them
" function! s:profile(opts) abort
"   for l:fname in keys(a:opts)
"     for l:dopt in keys(a:opts[l:fname])
"       call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
"     endfor
"   endfor
" endfunction

" call s:profile(s:denite_options)
"



" denite.nvim
" -----------

" INTERFACE
call denite#custom#option('_', {
  \ 'highlight_matched_char': 'NONE',
	\ 'auto_resume': 1,
	\ 'statusline': 0,
	\ 'smartcase': 1,
	\ 'vertical_preview': 0,
	\ 'direction': 'dynamicbottom',
	\ 'prompt': '❯ ',
	\ 'max_dynamic_update_candidates': 50000,
	\ 'winwidth': &columns,
	\ 'winheight': &lines / 3,
	\ 'wincol': 0,
	\ 'winrow': (&lines - 3) - (&lines / 3),
	\ })

if has('nvim')
	call denite#custom#option('_', { 'split': 'floating', 'statusline': 0 })
endif

" MATCHERS
" Default is 'matcher/fuzzy'
" call denite#custom#source('tag', 'matchers', ['matcher/substring'])

" SORTERS
" Default is 'sorter/rank'
" call denite#custom#source('file/rec,grep', 'sorters', ['sorter/sublime'])
call denite#custom#source('z', 'sorters', ['sorter_z'])

" CONVERTERS
" Default is none
call denite#custom#source(
	\ 'buffer,file_mru,file_old',
	\ 'converters', ['converter_relative_word'])

" narrow by path 
call denite#custom#source('grep',
	\ 'converters', ['converter_abbr_word'])


" FIND and GREP COMMANDS
" The Silver Searcher
" call denite#custom#var('file/rec', 'command', ['ag', '-U', '--hidden', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#var('file/rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

" Setup ignore patterns in your .agignore file!
" https://github.com/ggreer/the_silver_searcher/wiki/Advanced-Usage

call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('grep', 'default_opts',
	\ ['--vimgrep', '--smart-case'])


call denite#custom#var('buffer', 'date_format', '')

" KEY MAPPINGS
augroup user_plugin_denite
	autocmd!

	autocmd FileType denite call s:denite_settings()
	autocmd FileType denite-filter call s:denite_filter_settings()

	autocmd VimResized * call denite#custom#option('_', {
		\   'winwidth': &columns,
		\   'winheight': &lines / 3,
		\   'winrow': (&lines - 3) - (&lines / 3),
		\ })
augroup END

function! s:denite_settings() abort
	nnoremap <silent><buffer><expr> <CR> denite#do_map('do_action')
	nnoremap <silent><buffer><expr> i    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> /    denite#do_map('open_filter_buffer')
	nnoremap <silent><buffer><expr> dd   denite#do_map('do_action', 'delete')
	nnoremap <silent><buffer><expr> p    denite#do_map('do_action', 'preview')
	nnoremap <silent><buffer><expr> st   denite#do_map('do_action', 'tabopen')
	nnoremap <silent><buffer><expr> sg   denite#do_map('do_action', 'vsplit')
	nnoremap <silent><buffer><expr> sv   denite#do_map('do_action', 'split')
	nnoremap <silent><buffer><expr> '    denite#do_map('quick_move')
	nnoremap <silent><buffer><expr> q    denite#do_map('quit')
	nnoremap <silent><buffer><expr> r    denite#do_map('redraw')
	nnoremap <silent><buffer><expr> yy   denite#do_map('do_action', 'yank')
	nnoremap <silent><buffer><expr> <Esc>   denite#do_map('quit')
	nnoremap <silent><buffer><expr> <Tab>   denite#do_map('choose_action')
	nnoremap <silent><buffer><expr><nowait> <Space> denite#do_map('toggle_select').'j'
endfunction

function! s:denite_filter_settings() abort
	setlocal signcolumn=yes nocursorline nonumber norelativenumber
	" disable coc dans les filtres
	let b:coc_suggest_disable = 1
	call deoplete#custom#buffer_option('auto_complete', v:false)

	nnoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
	" inoremap <silent><buffer><expr> <Esc>  denite#do_map('quit')
	nnoremap <silent><buffer><expr> q      denite#do_map('quit')
	inoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
	nnoremap <silent><buffer><expr> <C-c>  denite#do_map('quit')
	inoremap <silent><buffer>       kk     <Esc><C-w>p
	nnoremap <silent><buffer>       kk     <C-w>p
	inoremap <silent><buffer>       <C-k>  <Esc><C-w>p
	nnoremap <silent><buffer>       <C-k>  <C-w>p
	inoremap <silent><buffer>       jj     <Esc><C-w>p
	nnoremap <silent><buffer>       jj     <C-w>p
	inoremap <silent><buffer>       <C-j>  <Esc><C-w>p
	nnoremap <silent><buffer>       <C-j>  <C-w>p
endfunction


" Denite key
nnoremap <F1> :Denite help<cr>
nnoremap <F2> :Denite register<cr>
nnoremap <nowait> <leader>j :Denite jump<cr>
nnoremap <C-p> :Denite file/rec -start-filter -no-statusline<cr>
nnoremap <nowait> <leader><space> :Denite buffer<cr>
nnoremap <leader>g :Denite grep<cr>
nnoremap <M-f> :Denite grep<cr>
