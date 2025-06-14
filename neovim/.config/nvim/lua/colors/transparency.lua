-- Ne vim UI
vim.api.nvim_set_hl(0, 'Normal', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'StatusLine', { bg = nil })
vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = '#18181a' })
vim.api.nvim_set_hl(0, 'CursorLine', { bg = '#2a2a2c', cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#444444' })

-- telescope.nvim
vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePromptTitle', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'TelescopeSelection', { fg = '#eeeeee', bg = '#353537', bold = true })

-- noice.nvim
vim.api.nvim_set_hl(0, 'NoiceCmdline', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePrompt', { bg = nil })
vim.api.nvim_set_hl(0, 'NoiceCmdlineIcon', { bg = nil })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopup', { bg = nil, cterm = { bg = nil } })
vim.api.nvim_set_hl(0, 'NoiceCmdlinePopupBorder', { bg = nil, cterm = { bg = nil } })

-- Neotree
vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#5f7a7f", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#eeeeee", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#7a8a4f", bg = "NONE" })
vim.api.nvim_set_hl(0, "NeoTreeCursorLineFile", { fg = "#1c1c1c", bg = "#eeeeee" })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#eeeeee" })
