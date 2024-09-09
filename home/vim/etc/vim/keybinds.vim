" Key remapping

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase " case insensitive search
set smartcase " case-sensitive is capital letter 
set hlsearch " highlight search results
set incsearch " incremental search
set magic " for regexs

match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$' " highlight conflicts

" General Mappings
set lazyredraw " stop redraw while exec macros

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
nmap <leader>w <cmd>w!<cr>
inoremap <C-c> <Esc>
imap <leader>w <C-c><cmd>w!<cr>
nmap <leader>q <cmd<q<cr>

" Tab movement
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

nnoremap <leader><leader>c :set cursorline!<cr> " toggle cursor line

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
nnoremap <leader>sf ^
nnoremap <leader>r <C-r>

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

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)