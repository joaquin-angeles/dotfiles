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

vim.cmd([[
  highlight Normal guifg=#eeeeee
  highlight NormalFloat guifg=#eeeeee
  highlight FloatBorder guifg=#eeeeee
  highlight NoiceCmdlinePopup guifg=#eeeeee
  highlight NoiceCmdlinePopupBorder guifg=#eeeeee
  highlight NoicePopup guifg=#eeeeee
  highlight NoicePopupBorder guifg=#eeeeee
  highlight NoiceCmdline guifg=#eeeeee
]])
