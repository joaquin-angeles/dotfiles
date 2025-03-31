local map = vim.keymap.set

-- Arrow key replacements in insert mode
map('i', '<C-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-k>', '<Up>', { noremap = true, silent = true })
map('i', '<C-l>', '<Right>', { noremap = true, silent = true })

-- Normal mode mappings
map('n', ';', ':', { noremap = true, silent = false })
map('n', '<C-p>', ':Neotree filesystem reveal left<CR>', {})
map('n', '<C-e>', require('telescope.builtin').find_files, { desc = 'Find Files' })

vim.api.nvim_set_keymap("n", "H", ":Neotree toggle hidden<CR>", { noremap = true, silent = true })
