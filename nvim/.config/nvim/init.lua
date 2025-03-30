require("config.lazy")     -- Plugin Manager
require("config.options")  -- Options
require("config.keymaps")  -- Keymaps
require("config.autocmds") -- Autocommands
require("config.lualine")  -- Lualine
require("config.theme")

-- Plugin configurations
require("config.plugins.telescope")
require("config.plugins.neo-tree")

-- Enable persistent undo
vim.opt.undofile = true

-- Set the directory for undo files
local undodir = vim.fn.expand('~/.config/nvim/undo')
vim.opt.undodir = undodir

-- Create the undo directory if it doesn't exist
if not vim.fn.isdirectory(undodir) then
  vim.fn.mkdir(undodir, "p", 0700)
end
