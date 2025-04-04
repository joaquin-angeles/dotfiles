require('telescope').setup({
  defaults = {
    mappings = {
      i = { ["<Esc>"] = require('telescope.actions').close },  -- Esc to close in insert mode
      n = { ["q"] = require('telescope.actions').close },    -- q to close in normal mode
    },
  }
})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
