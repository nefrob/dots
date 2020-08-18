" nefrob's vimrc
" https://github.com/nefrob/vim

" Disable vi compatibility      
set nocompatible

" Plugins {{{
    call plug#begin('~/.vim/plugged')

    " Themes
    Plug 'joshdick/onedark.vim'
    Plug 'ueaner/molokai'
    " Enhanced status bar
    Plug 'itchyny/lightline.vim'
    " Get git branch
    Plug 'itchyny/vim-gitbranch'
    " File browser
    Plug 'preservim/nerdtree'
    " Git diff side column
    Plug 'airblade/vim-gitgutter'
    " Comment lines
    Plug 'tpope/vim-commentary'
    " Easily modify surrounding pairs
    Plug 'tpope/vim-surround'
    " Repeat plugins with .
    Plug 'tpope/vim-repeat'
    " Search / replace word variants
    Plug 'tpope/vim-abolish'
    " Detect indent style (tabs vs. spaces)
    Plug 'tpope/vim-sleuth'
    " Special comment coloring
    Plug 'jbgutierrez/vim-better-comments'
    " Better startup screen
    Plug 'mhinz/vim-startify'
    " Buffer delete doesn't close window
    Plug 'moll/vim-bbye'

    call plug#end()
" }}}

" General {{{
    set shell=$SHELL " set shell
    set history=100 " command line history
    set undolevels=100 " undo actions to remember
    set clipboard=unnamed " use system clipboard
    set autoread " re-read file on outside change 
    set nobackup " don't save backups
    set nowritebackup " don't save backups
    set noswapfile
    set directory=~/.vim/.tmp,~/tmp,/tmp " in case swap files used
    set encoding=utf-8
    set nomodeline " security, disable mode lines
    set spell spelllang=en_us
    if has('mouse')
        set mouse=a
    endif

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
    set relativenumber " relative line numbers
    set ruler " always show cursor position
    set nocursorline " faster redraw, can toggle
    set wrap " line wrapping
    set ttyfast "faster redraw
    set laststatus=2 " last status line
    set cmdheight=2 " command bar height
    set title " terminal title
    set showmatch " matching braces
    set mat=2 " blink time (tenths of sec)
    set signcolumn=yes " for gitgutter
    set numberwidth=4
    set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:· " spacing chars visible 
    set t_Co=256 " tell vim terminal supports 256 colors
    " insert mode = line cursor, normal mode = block cursor
    set guicursor=n-v-c:block-Cursor
    set guicursor+=i:ver100-iCursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10

    set splitbelow " horizontal splits new window below
    set splitright " vertical splits new window to right

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
    set backspace=eol,start,indent " backspace no space-wise
    set textwidth=119 " max text width
    set scrolloff=1 " lines off edge of screen to keep

    " Tab movement
    nnoremap <TAB> >>
    nnoremap <S-TAB> <<
    inoremap <TAB> <C-i>
    inoremap <S-TAB> <C-d>

    " Code folding
    set foldmethod=syntax " fold based on indent
    set foldcolumn=2 " add a fold column
    set foldlevelstart=99
    set foldnestmax=10 "max fold levels
    set foldenable " allow folding by default
    set foldlevel=1

    nnoremap z0 :set foldlevel=0<cr>
    nnoremap z1 :set foldlevel=1<cr>
    nnoremap z9 :set foldlevel=99<cr>
    nnoremap <space>z za

    " Toggle fold column
    nnoremap <space>f :call FoldColumnToggle()<cr>
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
" }}}

" General Mappings {{{
    set lazyredraw " stop redraw while exec macros

    let mapleader = ","
    inoremap jj <ESC>

    map <leader>l :set list!<cr> " toggle invisible chars

    " Spell check toggle and remaps
    nnoremap <silent> <leader><leader>s :setlocal spell!<cr>
    map <leader>sn ]s " next mispelled
    map <leader>sp [s " previous mispelled
    map <leader>sg zg " add to dict (good)
    map <leader>sw zw " remove from dict (wrong)
    map <leader>sl z= " list of suggested corrections
   
    map <leader><space> :let @/=''<cr> " clear search, still need to exit search

    " Global-search-and-replace. Prompts for a replacement string and
    " will replace all matches from the previous search command
    nnoremap <leader><leader>r :let @/='<C-r>=expand("<cword>")<cr>'<cr>:set hls<cr>:%s//

    " General find-replace, follow command with word/new_word/g
    nnoremap <leader>fr :%s/

    " Saving / exiting
    nmap <leader>w :w!<cr>
    inoremap <C-c> <Esc>
    imap <leader>w <C-c>:w!<cr>
    nmap <leader>q :q<cr>

    nnoremap <leader>c :set cursorline!<cr> " toggle cursor line

    " Ensure move works on wrapped lines
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

    " Scroll faster
    nnoremap <S-j> 3<C-e>
    nnoremap <S-k> 3<C-y>

    " Line movement
    nnoremap <leader>e $
    nnoremap <leader>ye y$
    nnoremap <leader>de d$
    nnoremap <leader>f ^
    nnoremap <leader>r <C-r

    nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr> " strip trailing whitespace

    " Tab navigation
    map <leader>tn :tabnew<cr>
    map <leader>tc :tabclose<cr>
    map <leader>tt :tabnext<cr>
    map <leader>tp :tabprev<cr>
    map <leader>tm :tabmove
    " Provide buffer number to open in new tab
    nmap <leader>tb :tab sb
    
    " Toggle between this and the last accessed tab
    let g:lasttab = 1
    nmap <leader>tl :exe "tabn ".g:lasttab<CR>
    au TabLeave * let g:lasttab = tabpagenr()

    " opens a new tab with the current buffer's path
    "map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
    " Switch cwd to the directory of the open buffer
    "map <leader>cd :cd %:p:h<cr>:pwd<cr>

    " Window navigation
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-h> <C-w>h
    map <C-l> <C-w>l
    map <leader>sv :vsplit
    map <leader>sh :split

    " Buffer navigation
    map <leader>bn :bnext<cr>
    map <leader>bp :bprevious<cr>
    map <leader>bb :buffers<cr>
    map <leader>bs :b
    " Close the current buffer
    map <leader>bd :Bdelete<cr>
    " Close all the buffers
    map <leader>ba :bufdo Bdelete<cr>

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
        \},
        \   'tab': {
        \       'active': [ 'filename', 'modified' ],
        \       'inactive': [ 'filename', 'modified' ],
        \   },
        \ 'tabline': {
        \   'left': [ [ 'tabs' ] ],
        \   'right': [ [ 'close' ] ]
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

" Startify {{{
    let g:startify_files_number = 5
    let g:startify_change_to_dir = 0   
    let g:ascii = [
\ '',
\ '██╗  ██╗███████╗██╗     ██╗      ██████╗     ████████╗██╗  ██╗███████╗██████╗ ███████╗',
\ '██║  ██║██╔════╝██║     ██║     ██╔═══██╗    ╚══██╔══╝██║  ██║██╔════╝██╔══██╗██╔════╝',
\ '███████║█████╗  ██║     ██║     ██║   ██║       ██║   ███████║█████╗  ██████╔╝█████╗  ',
\ '██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██║   ██╔══██║██╔══╝  ██╔══██╗██╔══╝  ',
\ '██║  ██║███████╗███████╗███████╗╚██████╔╝       ██║   ██║  ██║███████╗██║  ██║███████╗',
\ '╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝        ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝',
\ '                      47 45 4E 45 52 41 4C 4B 45 4E 4F 42 49 21                       ',
\ '       _ ___  ___     _            _    ___       __   _   _  __ ___                  ',
\ '   |  |_  |    | |_| |_  |_|  /\  /  |/  |  |\ | /__  |_) |_ /__  |  |\ |             ',
\ '   |_ |_  |    | | | |_  | | /--\ \_ |\ _|_ | \| \_|  |_) |_ \_| _|_ | \|  o  o  o    ',
\ ''
\]
    let g:startify_custom_header = g:ascii
    let g:startify_relative_path = 1
    let g:startify_use_env = 1
    let g:startify_session_persistence = 1
    let g:startify_session_delete_buffers = 1

    " Custom startup list, only show MRU from current directory/project
    let g:startify_lists = [
    \  { 'type': 'files',     'header': [ 'Recent']          },
    \  { 'type': 'dir',       'header': [ 'Directory '. getcwd() ] },
    \  { 'type': 'sessions',  'header': [ 'Sessions' ]       },
    \  { 'type': 'bookmarks', 'header': [ 'Bookmarks' ]      },
    \  { 'type': 'commands',  'header': [ 'Commands' ]       },
    \ ]

    let g:startify_commands = [
    \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
    \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
    \ ]

    let g:startify_bookmarks = [
        \ { 'c': '~/.vim/.vimrc' }
    \ ]

    nmap <leader>st :Startify<cr>
    " Session management
    nnoremap <leader>ss :SSave!
    nnoremap <leader>sd :SDelete!
    nnoremap <leader>sc :SClose
" }}}

" VIMRC {{{
    nnoremap <silent> <leader>ev :e $MYVIMRC<CR> " edit vimrc
    nnoremap <silent> <leader>vv :so $MYVIMRC<CR> " reload vimrc
" }}}
