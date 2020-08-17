" nefrob's vimrc
" https://github.com/nefrob/vim

" Disable vi compatibility      
set nocompatible

" Plugins {{{
    call plug#begin('~/.vim/plugged')

    Plug 'joshdick/onedark.vim'
    Plug 'caksoylar/vim-mysticaltutor'
    Plug 'ueaner/molokai'
    Plug 'itchyny/lightline.vim'
    Plug 'itchyny/vim-gitbranch'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-surround' " "a" -> 'a' is cs"'

    call plug#end()
" }}}

" General {{{
    set shell=$SHELL
    set history=100 " command line history
    set undolevels=100 "undo actions to remember
    set clipboard=unnamed "use system clipboard

    set autoread " re-read file on outside change 
    set nobackup " don;t save backups
    set nowritebackup " don't save backups
    set noswapfile
    set directory=~/.vim/.tmp,~/tmp,/tmp " in case swap files used
    set encoding=utf-8

    set nomodeline " security, disable mode lines

    if has('mouse')
        set mouse=a
    endif

    set spell spelllang=en_us
    map <leader>ss :setlocal spell!<cr> " toggle spellcheck
    "map <leader>sn ]s
    "map <leader>sp [s
    "map <leader>sa zg
    "map <leader>s? z=

    set updatetime=1000 " for gitgutter + others update faster

    " Disable error sounds
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" Appearance {{{
    syntax on
    filetype plugin indent on
    set number " show line numbers
    set ruler " always show cursor position
    set nocursorline " faster redraw, can toggle
    set wrap " line wrapping
    set ttyfast "faster redraw
    set laststatus=2 " last status line
    set cmdheight=2 " command bar height
    set title " terminal title
    set showmatch " matching braces
    set mat=2 " blink time (tenths of sec)
    set signcolumn=yes " gitgutter
    set numberwidth=4
    set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:· " set spacing chars visible
    map <leader>l :set list!<cr> " toggle list

    set t_Co=256 " tell vim terminal supports 256 colors
    " insert mode = line cursor, normal mode = block cursor
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10

    colorscheme onedark " scheme
" }}}

" Formatting {{{
    set autoindent " auto indent newline
    set smartindent " insert extra indent if needed
    set copyindent " copy previous indentation on autoindent
    set smarttab " respect tabstop, shiftwidth, softtabstop
    set tabstop=4 " tab width
    set softtabstop=4 " edit as if tab width
    set shiftwidth=4 " indent/unindent width
    set shiftround " indent rounded to multiple of tab width
    set expandtab " use spaces instead of tabs
    " Format other people's code to conform
    nmap \t :set ts=4 sts=4 sw=4 noet<cr>
    nmap \s :set ts=4 sts=4 sw=4 et<cr>

    set backspace=eol,start,indent " backspace no space-wise
    set textwidth=119 " max text width
    set scrolloff=1 " lines off edge of screen to keep
    nnoremap <TAB> >>
    nnoremap <S-TAB> <<
    inoremap <TAB> <C-i>
    inoremap <S-TAB> <C-d>

    set foldmethod=syntax " fold based on indent
    set foldcolumn=2 " add a fold column
    set foldlevelstart=99
    set foldnestmax=10 "max fold levels
    set foldenable " allow folding by default
    set foldlevel=1

    nnoremap z0 :set foldlevel=0<cr>
    nnoremap z1 :set foldlevel=1<cr>
    nnoremap z2 :set foldlevel=2<cr>
    nnoremap <space> za

    " Toggle fold column
    nnoremap <leader>zf :call FoldColumnToggle()<cr>
    let g:last_fold_column_width = 4

    function! FoldColumnToggle()
        if &foldcolumn
            let g:last_fold_column_width = &foldcolumn
            setlocal foldcolumn=0
        else
            let &l:foldcolumn = g:last_fold_column_width
        endif
    endfunction
" }}}

" Files {{{
    set wildmenu " command line completion
    set wildmode=list:full " tab complete list
    set wildchar=<TAB>
    set wildignore=*.swp,*.0,*.class,*.pyc " ignore files when expanding
    set hidden " allow current buffer in background
    set showcmd " show commands
    set noshowmode " disable for lightline
    " }}}

    " Searching {{{
    nnoremap / /\v
    vnoremap / /\v
    set ignorecase " case insensitive search
    set smartcase " case-sensitive is capital letter 
    set hlsearch " highlight search results
    set incsearch " incremental search
    set magic " for regexs

    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts

    map <leader><space> :let @/=''<cr> " clear search

    " Global-search-and-replace. Prompts for a replacement string and
    " will replace all matches from the previous search command
    nnoremap <leader><leader>r :let @/=':<<C-R>=expand("<cword>")<cr>\>'<cr>:set hls<cr>:%s//
" }}}

" Mappings {{{
    set lazyredraw "stop redraw while exec macros

    let mapleader = ","
    inoremap jj <ESC>

    " Saving / exiting
    nmap <leader>w :w!<cr>
    inoremap <C-c> <Esc>
    imap <leader>w <C-c>:w!<cr>
    nmap <leader>q :q<cr>

    nnoremap <leader>bd :bd<cr> " close current buffer

    nnoremap <leader>c :set cursorline!<cr> " toggle cursor line

    " Ensure move works on wrapped lines
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$
    " Scroll faster
    nnoremap <S-k> 3<C-e>
    nnoremap <S-j> 3<C-y>

    " Line movement
    nnoremap <leader>e $
    nnoremap <leader>ye y$
    nnoremap <leader>de d$
    nnoremap <leader>0 ^
    nnoremap <leader>r <C-r

    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr> " strip trailing whitespace

    " nmap <silent> gTT :tab sb<cr> " open current buffer in new tab
    " tab navigation
    "map <leader>tn :tabnew<cr>
    "map <leader>tc :tabclose<cr>
    "map <leader>tt :tabnext<cr>
    "map <leader>tm :tabmove
    " toggle between this and the last accessed tab
    "let g:lasttab = 1
    "nmap <lLeader>tl :exe "tabn ".g:lasttab<CR>
    "au TabLeave * let g:lasttab = tabpagenr()

    " opens a new tab with the current buffer's path
    "map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
    " switch cwd to the directory of the open buffer
    "map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " window navigation
    "map <C-j> <C-W>j
    "map <C-k> <C-W>k
    "map <C-h> <C-W>h
    "map <C-l> <C-W>l
    " Close the current buffer
    "map <leader>bd :Bclose<cr>:tabclose<cr>gT
    " Close all the buffers
    "map <leader>ba :bufdo bd<cr>
    "map <leader>l :bnext<cr>
    "map <leader>h :bprevious<cr>

    " Disable arrow keys
    nnoremap <up> <nop>
    nnoremap <down> <nop>
    nnoremap <left> <nop>
    nnoremap <right> <nop>
    inoremap <up> <nop>
    inoremap <down> <nop>
    inoremap <left> <nop>
    inoremap <right> <nop>
" }}}

" Lightline {{{
    let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ],
        \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
        \   'right': [ [ 'percent' ], [ 'lineinfo' ], [ 'fileformat' ],
        \              [ 'fileencoding' ] ]
        \ },
        \ 'component_function': {
        \   'gitbranch': 'gitbranch#name'
        \}
    \}
" }}}

" NERDTree {{{
    nnoremap <leader>n :NERDTreeFocus<cr>
    nnoremap <leader>m :NERDTreeClose<cr>:NERDTreeFind<cr>
    nnoremap <leader>N :NERDTreeClose<cr>

    " Store the bookmarks file
    let NERDTreeBookmarksFile=expand("$HOME/.vim/NERDTreeBookmarks")

    " Show the bookmarks table on startup
    let NERDTreeShowBookmarks=1

    " Show hidden files, too
    let NERDTreeShowFiles=1
    let NERDTreeShowHidden=1

    " Quit on opening files from the tree
    let NERDTreeQuitOnOpen=1

    " Highlight the selected entry in the tree
    let NERDTreeHighlightCursorline=1

    " Use a single click to fold/unfold directories and a double click to open
    " files
    let NERDTreeMouseMode=2

    " Don't display these kinds of files
    let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
        \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]
" }}}

" VIMRC {{{
    " Edit vimrc file
    nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
    nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
" }}}

" Set marker folding for vimrc 
setlocal foldmethod=marker
