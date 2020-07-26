" disable vi compatibility
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
set numberwidth=4
set encoding=utf-8
set shell=/usr/bin/zsh
set hidden
" command bar height
set cmdheight=2
set cursorline

" disable error sounds
set noerrorbells
set novisualbell

" autocompletion
set wildchar=<TAB>
set wildmenu
" ignore files when expanding wildchars
set wildignore=*.0,*.class,*.pyc

" file stats
set ruler

" spacing
set wrap
set textwidth=119
set autoindent
set smartindent
set scrolloff=1
" only use space (no tab characters)
set expandtab
" shift tabs support
set smarttab
set tabstop=4
set shiftwidth=4
nnoremap <TAB> >>
nnoremap <S-TAB> <<
inoremap <TAB> <C-i>
inoremap <S-TAB> <C-d>

" matching brackets
set showmatch
set mat=2

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch
" for regexs
set magic

" stop redraw while exec macros
set lazyredraw

" rendering 
set ttyfast

" stop file backup
set nobackup
set nowritebackup
set noswapfile

" backspace remores all indents
set backspace=indent,eol,start

" use system clipboard
set clipboard=unnamed

" spelling
set spell spelllang=en_us
" toggles spellcheck
map <leader>ss :setlocal spell!<cr>

" status bar
set laststatus=2

" mode and last keys pressed
set showmode
set showcmd

" mouse support
set mouse=a

" macros /  hotkeys
let mapleader=","
nmap <leader>w :w!<cr>
inoremap <C-c> <Esc>
imap <leader>w <C-c>:w!<cr>
nmap <leader>q :q<cr>
inoremap jj <ESC>

nnoremap <leader>e $
nnoremap <leader>ye y$
nnoremap <leader>de d$
nnoremap <leader>0 ^
nnoremap <leader>r <C-r>

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
