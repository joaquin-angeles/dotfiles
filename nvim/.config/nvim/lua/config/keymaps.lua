local map = vim.keymap.set

map('n', ';', ':', { noremap = true, silent = false })
map('n', '<C-p>', ':Neotree filesystem reveal left<CR>', {})
map('n', '<C-e>', require('telescope.builtin').find_files, { desc = 'Find Files' })


vim.keymap.set("n", "<S-h>", "<C-w>h", { desc = "Focus Left" })
vim.keymap.set("n", "<S-j>", "<C-w>j", { desc = "Focus Down" })
vim.keymap.set("n", "<S-k>", "<C-w>k", { desc = "Focus Up" })
vim.keymap.set("n", "<S-l>", "<C-w>l", { desc = "Focus Right" })
