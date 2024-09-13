" Tab movement
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-d>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

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
