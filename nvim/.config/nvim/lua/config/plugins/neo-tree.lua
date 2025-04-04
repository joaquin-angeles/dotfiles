require('neo-tree').setup({})
vim.keymap.set('n', '<C-p>', ':Neotree filesystem reveal left<CR>', {})
vim.api.nvim_set_keymap("n", "<C-h>", ":Neotree toggle hidden<CR>", { noremap = true, silent = true })
