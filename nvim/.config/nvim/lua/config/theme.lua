for _, group in ipairs({
  "Normal", "NonText", "EndOfBuffer", "NormalFloat", "FloatBorder",
  "WinSeparator", "TelescopeNormal", "TelescopeBorder",
  "TelescopePromptNormal", "TelescopePromptBorder",
  "TelescopeResultsNormal", "TelescopeResultsBorder",
  "TelescopePreviewNormal", "TelescopePreviewBorder"
}) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end
