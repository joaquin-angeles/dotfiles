local map = vim.keymap.set

map('n', ';', ':', { noremap = true, silent = false })
map('n', '<C-p>', ':Neotree filesystem reveal left<CR>', {})
map('n', '<C-e>', require('telescope.builtin').find_files, { desc = 'Find Files' })

vim.api.nvim_set_keymap('i', '<C-h>', '<Left>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-j>', '<Down>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<Up>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-l>', '<Right>', { noremap = true, silent = true })

vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Focus Left" })
vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Focus Down" })
vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Focus Up" })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Focus Right" })

require('neo-tree').setup({})
vim.keymap.set('n', '<C-p>', ':Neotree filesystem reveal left<CR>', {})
vim.api.nvim_set_keymap("n", "<C-h>", ":Neotree toggle hidden<CR>", { noremap = true, silent = true })


