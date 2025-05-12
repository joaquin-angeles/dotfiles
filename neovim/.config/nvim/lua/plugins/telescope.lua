return {
  'nvim-telescope/telescope-fzf-native.nvim',
  build = 'cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S . -B build -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',
  dependencies = { 'nvim-telescope/telescope.nvim' },
  config = function()
    require('telescope').load_extension('fzf')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')
    require('telescope').setup{
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          width = 0.75,
          preview_width = 0.5,
        },
        mappings = {
          i = {
            ["<C-x>"] = actions.select_horizontal,
          },
        },
      }
    }
    vim.api.nvim_set_keymap('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>fg', ":lua require('telescope.builtin').live_grep()<CR>", { noremap = true, silent = true })
  end
}
