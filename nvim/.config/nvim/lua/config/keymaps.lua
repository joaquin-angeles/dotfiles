local map = vim.keymap.set
local unmap = vim.api.nvim_del_keymap

map('n', ';', ':', { noremap = true, silent = false })
map('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})
map("n", ".", ":Neotree toggle hidden<CR>", { noremap = true, silent = true })
map('n', '.', ':lua if vim.fn.exists(":NeoTree") == 2 then vim.cmd("Neotree toggle hidden") end<CR>', { noremap = true, silent = true })

map('i', '<C-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-k>', '<Up>', { noremap = true, silent = true })
map('i', '<C-l>', '<Right>', { noremap = true, silent = true })

map("n", "<S-h>", "<C-w>h", { desc = "Focus Left" })
map("n", "<S-j>", "<C-w>j", { desc = "Focus Down" })
map("n", "<S-k>", "<C-w>k", { desc = "Focus Up" })
map("n", "<S-l>", "<C-w>l", { desc = "Focus Right" })
