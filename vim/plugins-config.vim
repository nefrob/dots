" Plugin settings

" Lightline
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

" NERDTree
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

" Startify
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
    \ { 'c': '~/.vim/.vimrc' },
    \ { 'z': '~/.zsh/.zshrc' },
    \ { 't': '~/.tmux.conf' }
\ ]

nmap <leader>st :Startify<cr>
" Session management
nnoremap <leader>ss :SSave!
nnoremap <leader>sd :SDelete!
nnoremap <leader>sc :SClose

" Commentary
nnoremap <leader>c :Commentary<cr>
vnoremap <leader>c :Commentary<cr>

" Sneak
let g:sneak#label = 1 " label mode (easymotion alternative)
let g:sneak#s_next = 1 " next search result with s
let g:sneak#prompt = '🔎'

" Coc
let g:coc_global_extensions = [
    \ 'coc-pyright'
\ ]

let g:LanguageClient_serverCommands = {
\ }

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
inoremap <silent><expr> <c-space> coc#refresh()
else
inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer 
" in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>k :call <SID>show_documentation()<CR>

function! s:show_documentation()
if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
else
    call CocAction('doHover')
endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
