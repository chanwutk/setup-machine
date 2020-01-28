set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'

  " Git plugin not hosted on GitHub
  Plugin 'git://git.wincent.com/command-t.git'

  Bundle 'danielroseman/pygd-vim'
call vundle#end()            " required
filetype plugin indent on    " required


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
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'ayu-theme/ayu-vim'

   " Better Visual Guide
   Plug 'Yggdroot/indentLine'

   " syntax check
   Plug 'w0rp/ale'

   " Autocomplete
   Plug 'ncm2/ncm2'
   Plug 'roxma/nvim-yarp'
   Plug 'ncm2/ncm2-bufword'
   Plug 'ncm2/ncm2-path'
   Plug 'ncm2/ncm2-jedi'           " for python
   Plug 'deoplete-plugins/deoplete-jedi'

   " Formater
   Plug 'ambv/black'

   " Syntax Highlighting
   Plug 'vim-python/python-syntax'

call plug#end()

" UI configuration
syntax on
syntax enable

" True Color Support if it's avaiable in terminal
if has("termguicolors")
  set termguicolors
endif

" colorscheme
let ayucolor="mirage"
colorscheme ayu

if has("gui_running")
  set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif

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
set tabstop=2
set shiftwidth=2

" vim-autoformat
noremap <F3> :Autoformat<CR>

" NCM2
augroup NCM2
    autocmd!
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

    " When the <Enter> key is pressed while the popup menu is visible, it only
    " hides the menu. Use this mapping to close the menu and also start a new line.
    inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

    " uncomment this block if you use vimtex for LaTex
    " autocmd Filetype tex call ncm2#register_source({
    "           \ 'name': 'vimtex',
    "           \ 'priority': 8,
    "           \ 'scope': ['tex'],
    "           \ 'mark': 'tex',
    "           \ 'word_pattern': '\w+',
    "           \ 'complete_pattern': g:vimtex#re#ncm2,
    "           \ 'on_complete': ['ncm2#on_complete#omni', 'vimtex#complete#omnifunc'],
    "           \ })

    " cycle through completion list with tab/shift+tab
    inoremap <expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
    inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
augroup END

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
let g:ale_python_flake8_option = '--ignore=E203'

" Airline
let g:airline_left_sep  = ''
let g:airline_right_sep = ''
let g:airline#extensions#ale#enabled = 1
let airline#extensions#ale#error_symbol = 'E:'
let airline#extensions#ale#warning_symbol = 'W:'

" Autoformat
autocmd BufWritePre *.py execute ':Black'

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

" indent line format
let g:indentLine_showFirstIndentLevel = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" nerd tree open to new tab by default
let NERDTreeMapOpenInTab='t'

" syntax highlight everything for python
let g:python_highlight_all = 1

" set colorcolumn=90
" highlight ColorColumn ctermbg=darkgrey
