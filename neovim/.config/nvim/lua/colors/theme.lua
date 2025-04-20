-- set the background of neovim to transparent
vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
vim.cmd("hi Normal guifg=#eeeeee")
vim.cmd("hi Visual guibg=#323232 guifg=NONE gui=NONE")

-- For plugins with floating windows or popups
vim.cmd("hi StatusLine guibg=NONE")
vim.cmd("hi StatusLineNC guibg=NONE")
vim.cmd("hi NormalFloat guibg=NONE ctermbg=NONE")
vim.cmd("hi CursorLine guibg=#282828 ctermbg=NONE")
vim.cmd("hi CursorLineNr guifg=#6e8f2a gui=bold ctermfg=255 cterm=bold")
vim.cmd("hi FloatBorder guibg=NONE ctermbg=NONE")

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
vim.cmd('hi TelescopeSelection guifg=#eeeeee guibg=#333333 gui=bold')

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

