-- Set the background of Neovim to transparent
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("highlight Normal guifg=#eeeeee")

-- For plugins with floating windows or popups
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi CursorLine guibg=#282828 ctermbg=NONE")
vim.cmd("hi CursorLineNr guifg=#6e8f2a gui=bold ctermfg=255 cterm=bold")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi Pmenu guibg=NONE ctermbg=NONE")
vim.cmd("hi PmenuSel guibg=NONE ctermbg=NONE")

-- Specific plugin UIs
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
vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#eeeeee", bg = "#333333", bold = true })

-- Noice plugin UI transparency
vim.cmd("hi NoicePopup guibg=NONE ctermbg=NONE")
vim.cmd("hi NoicePopupBorder guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceMessage guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceMessageView guibg=NONE")
vim.cmd("hi NoiceMessageViewBorder guibg=NONE")
vim.cmd("hi NoiceCmdline guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceCmdlinePrompt guibg=NONE")
vim.cmd("hi NoiceCmdlineIcon guibg=NONE")
vim.cmd("hi NoiceCmdlinePopup guibg=NONE ctermbg=NONE")
vim.cmd("hi NoiceCmdlinePopupBorder guibg=NONE ctermbg=NONE")

-- UndoTree plugin transparency
vim.cmd("hi UndoTreeNormal guibg=NONE ctermbg=NONE")

-- Pmenu transparency for completion menu
vim.cmd("hi Pmenu guibg=NONE ctermbg=NONE")
vim.cmd("hi PmenuSel guibg=NONE ctermbg=NONE")
