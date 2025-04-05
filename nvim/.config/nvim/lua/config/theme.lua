for _, group in ipairs({
  "Normal", "NonText", "EndOfBuffer", "NormalFloat", "FloatBorder",
  "WinSeparator", "TelescopeNormal", "TelescopeBorder",
  "TelescopePromptNormal", "TelescopePromptBorder",
  "TelescopeResultsNormal", "TelescopeResultsBorder",
  "TelescopePreviewNormal", "TelescopePreviewBorder"
}) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NormalFloat guibg=NONE ctermbg=NONE
  highlight FloatBorder guibg=NONE ctermbg=NONE
  highlight NoiceCmdlinePopup guibg=NONE ctermbg=NONE
  highlight NoiceCmdlinePopupBorder guibg=NONE ctermbg=NONE
]])

-- Set background of cmdline popup elements to NONE
vim.cmd("hi NoiceCmdlinePopup guibg=NONE")
vim.cmd("hi NoiceCmdlinePopupBorder guibg=NONE")
vim.cmd("hi NoiceCmdlinePrompt guibg=NONE")
vim.cmd("hi NoiceCmdlineIcon guibg=NONE")

-- Set background of messages popup elements to NONE
vim.cmd("hi NoiceMessageView guibg=NONE")
vim.cmd("hi NoiceMessageViewBorder guibg=NONE")

-- Set background of popupmenu elements to NONE
vim.cmd("hi NoicePopupmenu guibg=NONE")
vim.cmd("hi NoicePopupmenuBorder guibg=NONE")
vim.cmd("hi NoicePopupmenuMatch guibg=NONE")
vim.cmd("hi NoicePopupmenuSelected guibg=NONE")

