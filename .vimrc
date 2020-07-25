" use vim not vi settings
set nocompatible

" force plugins to load correctly (turned back on below)
filetype off

" plugins
" add here

" load plugins
filetype plugin indent on

" basic settings
syntax on
set number
set encoding=utf-8
set shell=/usr/bin/zsh
set spell spelllang=en_us
set hidden

" file stats
set ruler

" spacing
set wrap
set textwidth=79
set textwidth=119
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set scrolloff=10
" only use space (no tab characters)
set expandtab

" rendering 
set ttyfast

" status bar?
set laststatus=2

" last line
set showmode
set showcmd

" mouse support
set mouse=a

" hotkeys
let mapleader=","
inoremap jj <ESC>

" custom shortcuts
" add here

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
" colorscheme coklorscheme_name
set background=dark
