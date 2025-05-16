-- Neovim UI
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi CursorLine guibg=#282828 ctermbg=NONE")
vim.cmd("hi StatusLine guibg=NONE")
vim.cmd("hi StatusLineNC guibg=NONE")

-- noice.nvim
vim.cmd("hi NoiceCmdline guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceCmdlinePrompt guibg=NONE")
vim.cmd("hi NoiceCmdlineIcon guibg=NONE")
vim.cmd("hi NoiceCmdlinePopup guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceCmdlinePopupBorder guibg=NONE ctermbg=NONE")

-- Telescope
vim.cmd("hi TelescopeNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopeBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePromptNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePromptBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePromptTitle guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopeResultsNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopeResultsBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopeResultsTitle guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePreviewNormal guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePreviewBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi TelescopePreviewTitle guibg=NONE ctermbg=NONE")
vim.cmd('hi TelescopeSelection guifg=#eeeeee guibg=#333333 gui=bold')

-- Neotree
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#5f7a7f", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#eeeeee", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#1b82b3", bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeCursorLineFile", { fg = "#1c1c1c", bg = "#eeeeee" })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#eeeeee" })
