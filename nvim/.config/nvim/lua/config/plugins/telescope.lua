require('telescope').setup({
  defaults = {
    mappings = {
      i = {
	["<Esc>"] = require('telescope.actions').close, 
	},
      n = { ["q"] = require('telescope.actions').close },
      
    },
  }
})

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find Files' })
