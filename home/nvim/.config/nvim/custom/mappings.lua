local M = {}

M.saving = {
    i = {
        -- save
        ["<leader>w"] = { "<cmd> w <CR>", "save buffer" },
    },
    n = {
        -- save
        ["<leader>w"] = { "<cmd> w <CR>", "save buffer" },
        -- save and quit
        ["<leader>wq"] = { "<cmd> wq <CR>", "save and close buffer" },
    },
}

M.tabbing = {
    i = {
        -- outdent
        ["<S-Tab>"] = { "<C-d>", "outdent" },
    },
    n = {
        -- indent and outdent
        ["<C-]>"] = { ">>", "indent" },
        ["<C-[>"] = { "<<", "outdent" },
    },
    v = {
        -- indent and outdent
        ["<C-]>"] = { ">gv", "indent" },
        ["<C-[>"] = { "<gv", "outdent" },
    },
}

M.movement = {
    n = {
        -- line movement on wrapped lines
        -- first two are already done by nvchad
        -- ["<silent> j"] = { "gj", "down" },
        -- ["<silent> k"] = { "gk", "up" },
        ["<silent> h"] = { "g^", "start" },
        ["<silent> l"] = { "g$", "end" },
        ["<leader>e"] = { "$", "end" },
        ["<leader>ye"] = { "y$", "copy though end" },
        ["<leader>de"] = { "d$", "delete through end" },
        ["<leader>sf"] = { "^", "start" },
    },
}

M.scroll = {
    n = {
        ["<S-j>"] = { "<C-e>", "scroll down" },
        ["<S-k>"] = { "<C-y>", "scroll up" },
    },
}

M.scroll = {
    n = {
        ["<S-j>"] = { "<C-e>", "scroll down" },
        ["<S-k>"] = { "<C-y>", "scroll up" },
    },
}

return M
