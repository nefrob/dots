local opt = vim.opt
local g = vim.g
local keymap = vim.api.nvim_set_keymap

-- escape in in sert mode
keymap('i', 'jj', '<Esc>', {})

-- saving and exiting
keymap('n', '<leader>w', ':w<cr>', {})
keymap('i', '<leader>w', '<Esc>:w<cr>', {})
keymap('n', '<leader>wq', ':wq<cr>', {})

-- TODO add tabbing mappings once some coding is done

-- " Tab movement
-- nnoremap <Tab> >>_
-- nnoremap <S-Tab> <<_
-- inoremap <S-Tab> <C-d>
-- vnoremap <Tab> >gv
-- vnoremap <S-Tab> <gv

-- " Ensure move works on wrapped lines
-- nnoremap <silent> j gj
-- nnoremap <silent> k gk
-- nnoremap <silent> ^ g^
-- nnoremap <silent> $ g$

-- " Scroll faster
-- nnoremap <S-j> 3<C-e>
-- nnoremap <S-k> 3<C-y>

-- " Line movement
-- nnoremap <leader>e $
-- nnoremap <leader>ye y$
-- nnoremap <leader>de d$
-- nnoremap <leader>sf ^
-- nnoremap <leader>r <C-r>
