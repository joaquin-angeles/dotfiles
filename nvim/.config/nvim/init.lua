-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.o.termguicolors = false
vim.cmd("colorscheme default")

-- In normal mode
vim.api.nvim_set_keymap("n", "<RightMouse>", "<Nop>", { noremap = true, silent = true })

-- In visual mode
vim.api.nvim_set_keymap("v", "<RightMouse>", "<Nop>", { noremap = true, silent = true })

-- In insert mode
vim.api.nvim_set_keymap("i", "<RightMouse>", "<Nop>", { noremap = true, silent = true })

vim.opt.mousemodel = "extend"

vim.cmd("aunmenu PopUp")

-- Disable true color to use terminal colors
vim.opt.termguicolors = false

-- Set the background color to none to enable terminal transparency
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE", fg = "#eeeeee" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#3e3e3e", fg = "#c1ddff" })

-- Define custom highlight groups based on terminal colors
vim.api.nvim_set_hl(0, "Cursor", { ctermfg = 0, ctermbg = 15 }) -- Cursor
vim.api.nvim_set_hl(0, "Visual", { ctermfg = 0, ctermbg = 12 }) -- Selection
vim.api.nvim_set_hl(0, "Comment", { ctermfg = 8 }) -- Comments (gray)
vim.api.nvim_set_hl(0, "Constant", { ctermfg = 9 }) -- Constants (red)
vim.api.nvim_set_hl(0, "String", { ctermfg = 10 }) -- Strings (green)
vim.api.nvim_set_hl(0, "Identifier", { ctermfg = 12 }) -- Identifiers (blue)
vim.api.nvim_set_hl(0, "Function", { ctermfg = 13 }) -- Functions (magenta)
vim.api.nvim_set_hl(0, "Statement", { ctermfg = 11 }) -- Statements (yellow)
vim.api.nvim_set_hl(0, "PreProc", { ctermfg = 14 }) -- Preprocessor (cyan)
vim.api.nvim_set_hl(0, "Type", { ctermfg = 6 }) -- Types (cyan)
vim.api.nvim_set_hl(0, "Special", { ctermfg = 5 }) -- Special characters (magenta)
vim.api.nvim_set_hl(0, "Error", { ctermfg = 15, ctermbg = 1 }) -- Errors (white on red)
vim.api.nvim_set_hl(0, "Todo", { ctermfg = 0, ctermbg = 11 }) -- TODO comments (black on yellow)

-- Optional: Reset syntax highlighting to apply changes
vim.cmd("syntax on")
