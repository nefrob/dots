" Base vim options

" General
set shell=$SHELL
set history=1000
set undolevels=64
set autoread
set nobackup
set nowritebackup
set noswapfile
set directory=~/.vim/.tmp,~/tmp,/tmp
set encoding=utf-8
set nomodeline " security, disable mode lines
set spell spelllang=en_us
set nospell


" Formatting
set autoindent
set smartindent
set copyindent
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set backspace=eol,start,indent
set textwidth=99
"  set scrolloff=1 " lines off edge of screen

" Appearance 
syntax on
filetype plugin indent on
set relativenumber
set ruler
set cmdheight=2
set title
set showmatch

set background=dark

" Completion
set wildmenu 
set wildmode=list:full
set wildchar=<TAB>
set hidden
set showcmd

" Searching
set ignorecase
set smartcase 
set hlsearch
set incsearch
set magic 

" Code folding
set foldmethod=syntax " fold based on indent
" set foldcolumn=2 " add a fold column
set foldlevelstart=99
set foldnestmax=10 "max fold levels
set foldenable " allow folding by default
set foldlevel=1

" insert mode = line cursor, normal mode = block cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set splitbelow " horizontal splits new window below
set splitright " vertical splits new window to right
