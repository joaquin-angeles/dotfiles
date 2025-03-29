require("config.lazy")
vim.opt.showmode = false

vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
vim.api.nvim_set_hl(0, "NonText", { bg = "NONE" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "NONE" })

vim.opt.fillchars = {eob = " "}
vim.wo.number = true

vim.opt.cursorline = true
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#EEEEEE' })

vim.api.nvim_set_keymap('n', ';', ':', { noremap = true, silent = false })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-e>', builtin.find_files, { desc = 'Find Files' })

require('lualine').setup({
  options = {
    section_separators = { left = '', right = '' }, -- Rounded separators
    component_separators = { left = '', right = '' },
    theme = {
      normal = {
        a = { fg = '#1c1c1c', bg = '#eeeeee' }, -- NORMAL mode
        b = { fg = '#eeeeee', bg = '#3a3a3a' },
        c = { bg = 'NONE' },
      },
      insert = {
        a = { fg = '#1c1c1c', bg = '#9ab69b' }, -- INSERT mode (greenish)
        b = { fg = '#eeeeee', bg = '#3a3a3a' },
        c = { bg = 'NONE' },
      },
      visual = {
        a = { fg = '#1c1c1c', bg = '#d4b483' }, -- VISUAL mode (yellowish)
        b = { fg = '#eeeeee', bg = '#3a3a3a' },
        c = { bg = 'NONE' },
      },
      replace = {
        a = { fg = '#1c1c1c', bg = '#ff5f5f' }, -- REPLACE mode (optional color)
        b = { fg = '#eeeeee', bg = '#3a3a3a' },
        c = { bg = 'NONE' },
      },
      command = {
        a = { fg = '#1c1c1c', bg = '#9dbcd4' }, -- COMMAND mode (bluish)
        b = { fg = '#eeeeee', bg = '#3a3a3a' },
        c = { bg = 'NONE' },
      },
      inactive = {
        a = { fg = '#888888', bg = '#1c1c1c' },
        b = { fg = '#888888', bg = '#1c1c1c' },
        c = { bg = 'NONE' },
      },
    },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return ' ' .. str -- Prepend Vim icon to mode
        end,
      },
    },
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {
      {'location'},
      {
        function()
          return ' ' .. os.date('%I:%M %p') -- Clock in the corner
        end,
      },
    },
  },
})

