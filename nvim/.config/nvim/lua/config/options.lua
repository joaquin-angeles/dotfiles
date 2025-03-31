vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.cursorline = true
vim.cmd("hi CursorLine guibg=#242424 ctermbg=NONE")
vim.cmd("hi CursorLineNr guifg=#eeeeee gui=bold ctermfg=255 cterm=bold")
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#708090" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#708090" })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#708090", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#eeeeee", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#1c1c1c", bg = "#708090" })
vim.api.nvim_set_hl(0, "NeoTreeCursorLineFile", { fg = "#1c1c1c", bg = "#eeeeee" })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#eeeeee" })
