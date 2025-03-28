-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")

-- Enable true color support
vim.opt.termguicolors = true

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#90ee90", bg = "NONE" })

-- Define highlight groups with custom colors
vim.api.nvim_set_hl(0, "Normal", { fg = "#eeeeee", bg = "#1c1c1c" })
vim.api.nvim_set_hl(0, "Cursor", { fg = "#feffff", bg = "#eeeeee" })
vim.api.nvim_set_hl(0, "Visual", { fg = "#3e3e3e", bg = "#c1ddff" })
vim.api.nvim_set_hl(0, "Comment", { fg = "#555555" })
vim.api.nvim_set_hl(0, "Constant", { fg = "#be7472" })
vim.api.nvim_set_hl(0, "String", { fg = "#709772" })
vim.api.nvim_set_hl(0, "Identifier", { fg = "#708090" })
vim.api.nvim_set_hl(0, "Function", { fg = "#727399" })
vim.api.nvim_set_hl(0, "Statement", { fg = "#ff9900" })
vim.api.nvim_set_hl(0, "Operator", { fg = "#9fbdde" })
vim.api.nvim_set_hl(0, "Type", { fg = "#6fbbbc" })
vim.api.nvim_set_hl(0, "Special", { fg = "#989abc" })
vim.api.nvim_set_hl(0, "Error", { fg = "#be7472", bg = "#252525" })
vim.api.nvim_set_hl(0, "Todo", { fg = "#989772", bg = "#fefdbc", bold = true })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#555555" })
vim.api.nvim_set_hl(0, "StatusLine", { fg = "#feffff", bg = "#252525" })
vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#7f7f7f", bg = "#252525" })
vim.api.nvim_set_hl(0, "Pmenu", { fg = "#feffff", bg = "#252525" })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = "#252525", bg = "#9fbdde" })
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#be7472" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fefdbc" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#708090" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#709772" })
