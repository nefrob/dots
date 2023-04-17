local keymap = vim.api.nvim_set_keymap

-- escape in insert mode
keymap('i', 'jj', '<Esc>', {})
