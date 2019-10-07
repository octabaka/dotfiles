" let g:UltiSnipsSnippetsDir = "~/dev/vim/snippets"
"

" ###### STARTIFY 
" let g:startify_custom_header =
   " \ map(split(system('taoup-fortune'), '\n'), '"   ". v:val')
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 0
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_session_remove_lines = ['vim-simpledb-result.txt']
let g:startify_list_order = [
         \ ['These are my bookmarks:'],
         \ 'bookmarks',
         \ ['Fichiers utilisés dans ce répertoire'],
         \ 'dir',
         \ ['  Sessions'],
         \ 'sessions',
         \ ['These are my commands:'],
         \ 'commands',
         \ ]

let g:startify_bookmarks = [
         \ { 'c': '~/.vimrc' },
         \ { 'b': '~/.bashrc' },
         \ { 'i': '~/.config/i3/config' },
         \ { 'n': '~/Bureau/blocNote.txt' },
         \ ]
let g:startify_change_to_dir = 0
let g:startify_relative_path = 0



let g:ansible_options = {'ignore_blank_lines': 0}

autocmd BufNewFile,BufRead Vagrantfile set syntax=ruby
