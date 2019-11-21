" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

   Plug 'scrooloose/nerdtree'
   " Plug 'scrooloose/syntastic'
   Plug 'tpope/vim-surround'
   Plug 'scrooloose/nerdcommenter'
   Plug 'jiangmiao/auto-pairs'
   Plug 'christoomey/vim-tmux-navigator'

   " UI related
   Plug 'chriskempson/base16-vim'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   " Plug 'ayu-theme/ayu-vim'   

   " Better Visual Guide
   Plug 'Yggdroot/indentLine'

   " syntax check
   Plug 'w0rp/ale'

   " Formater
   " Plug 'Chiel92/vim-autoformat'
   " Plug 'ambv/black'

   " Syntax Highlighting
   Plug 'vim-python/python-syntax'
   Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()

" UI configuration
syntax on
syntax enable

" colorscheme
" let ayucolor = "mirage"
" colorscheme ayu

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

" if has("gui_running")
    " set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
" endif

set number
" set relativenumber

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase                    " ignore case when searching
set smartcase                     " turn on smartcase

" Tab and Indent configuration
set expandtab
set tabstop=4
set shiftwidth=4

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Ale
 let g:ale_lint_on_enter = 0
 let g:ale_lint_on_text_changed = 'never'
 let g:ale_echo_msg_error_str = 'E'
 let g:ale_echo_msg_warning_str = 'W'
 let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
 let g:ale_linters = {'python': ['flake8']}

 " Airline
 let g:airline_left_sep  = ''
 let g:airline_right_sep = ''
 let g:airline#extensions#ale#enabled = 1
 let airline#extensions#ale#error_symbol = 'E:'
 let airline#extensions#ale#warning_symbol = 'W:'

 " Autoformat
 " autocmd BufWritePre *.py execute ':Black'

 " Sets how many lines of history VIM has to remember
 set history=1000

 " Enable filetype plugins
 filetype plugin on
 filetype indent on

 " Set to auto read when a file is changed from the outside
 set autoread

 " set cursor at the middle of the screen
 set scrolloff=99999

 " set leader key to '\'
 let mapleader = '\'

 " mapping
 map <silent> <C-n> :NERDTreeToggle<CR>

 " set indent line color to grey
 let g:indentLine_color_term = 7

 " Add spaces after comment delimiters by default
 let g:NERDSpaceDelims = 1

 " nerd tree open to new tab by default
 let NERDTreeMapOpenInTab='t'

 " syntax highlight everything for python
 let g:python_highlight_all = 1
