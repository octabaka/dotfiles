set shell=/bin/bash
syntax on                      " Syntax highlighting

set noerrorbells
set scrolloff=3    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set shiftwidth=2   " Use indents of 4 spaces
set expandtab
set nocompatible
syntax on                      " Syntax highlighting
filetype plugin indent on      " Automatically detect file types
set autoindent                 " Indent at the same level of the previous line
set autoread                   " Automatically read a file changed outside of vim
set backspace=indent,eol,start " Backspace for dummies
set complete-=i                " Exclude files completion
" set completeopt=menu,menuone,noselect

set display=lastline           " Show as much as possible of the last line
set encoding=utf-8             " Set default encoding
set history=10000              " Maximum history record
set hlsearch                   " Highlight search terms
set incsearch                  " Find as you type search
set laststatus=2               " Always show status line
set mouse=a                    " Automatically enable mouse usage
set smarttab                   " Smart tab
set ttyfast                    " Faster redrawing
set viminfo+=!                 " Viminfo include !
set wildmenu                   " Show list instead of just completing
set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
set ignorecase     " Case insensitive search
set smartcase      " ... but case sensitive when uc present
"set scrolljump=5   " Line to scroll when cursor leaves screen
set scrolloff=3    " Minumum lines to keep above and below cursor
set nowrap         " Do not wrap long lines
set shiftwidth=2   " Use indents of 4 spaces
set tabstop=2      " An indentation every four columns
set expandtab
" set softtabstop=0  " Let backspace delete indent
set splitright     " Puts new vsplit windows to the right of the current
set splitbelow     " Puts new split windows to the bottom of the current
set autowrite      " Automatically write a file when leaving a modified buffer
set mousehide      " Hide the mouse cursor while typing
set hidden         " Allow buffer switching without saving
set ruler          " Show the ruler
set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
set showmode       " Show current mode in command-line
set showmatch      " Show matching brackets/parentthesis
set matchtime=5    " Show matching time
set report=0       " Always report changed lines
set linespace=0    " No extra spaces between rows
set pumheight=20   " Avoid the pop up menu occupying the whole screen
" set number relativenumber
set number 
set cursorline 
set clipboard=unnamedplus
" set switchbuf=usetab,newtab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.
set switchbuf=usetab "This should mean switching to the existing tab if the buffer is open, or creating a new one if not.

set t_ut=
" set t_te=

set winminheight=0
" set wildmode=list:longest,full
set wildmode=longest,list,full
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶

set whichwrap+=<,>,h,l  " Allow backspace and cursor keys to cross line boundaries

set termencoding=utf-8
set fileencoding=utf-8
set nobackup
set noswapfile
set nowritebackup

set foldmethod=manual

set wildignore+=*/node_modules/*,*/.git/*,*.min.js,*.min.css

set noshowmode
set sessionoptions-=options " disable options from sessions

" NETRW"
let g:netrw_banner=0
let g:netrw_altv=1
let g:netrw_liststyle=4
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
let g:netrw_preview = 0
let g:netrw_keepdir=0
let g:netrw_winsize = 18
" let g:netrw_browse_split = 4
"
" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif


let g:floaterm_position = 'center'
let g:floaterm_width = 100
let g:floaterm_height = 30
" let g:floaterm_borderchars = '        '
let g:floaterm_title = ''

let g:lf_map_keys = 0
let g:lf_replace_netrw = 1 " Open lf when vim opens a directory
lua << EOF
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--hidden',
      '--glob', '!.git/*',
      '--glob', '!.gitignore',
      '--glob', '!node_modules',
      '--glob', '!__sapper__',
      '--glob', '!package-lock.json',
    },
    prompt_position = "bottom",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "descending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    file_ignore_patterns = {"node_modules", "__sapper__"} ,
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker
  }
}
local actions = require('telescope.actions')
-- Global remapping
------------------------------
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
        -- Add up multiple actions
        ["<cr>"] = actions.select_default + actions.center,
        -- You can perform as many actions in a row as you like
        -- ["<cr>"] = actions.select_default + actions.center + my_cool_custom_action,
      },
      n = {
        ["<esc>"] = actions.close,
        ["q"] = actions.close,
      },
    },
  }
}
require('telescope').setup {
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')

EOF
