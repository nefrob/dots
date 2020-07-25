" use vim not vi settings
set nocompatible

" force plugins to load correctly (turned back on below)
filetype off

" plugins
execute pathogen#infect()

" read file if changed outside
set autoread
au FocusGained,BufEnter * checktime

" load plugins
syntax on
filetype plugin indent on

" basic settings
set number
set encoding=utf-8
set shell=/usr/bin/zsh
set hidden
set cmdheight=1

" autocompletion
set wildmenu

" file stats
set ruler

" spacing
set wrap
set textwidth=119
set autoindent
set smartindent
set scrolloff=10
" only use space (no tab characters)
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" matching brackets
set showmatch
set mat=2

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" stop redraw while exec macros
set lazyredraw

" rendering 
set ttyfast

" spelling
set spell spelllang=en_us
" ss toggles spellcheck
map <leader>ss :setlocal spell!<cr>

" status bar
set laststatus=2

" last line
set showmode
set showcmd

" mouse support
set mouse=a

" hotkeys
let mapleader=" "
nmap <leader>w :w!<cr>
inoremap jj <ESC>


" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" appearance
colorscheme molokai
