-- Transparent background
for _, group in ipairs({ "Normal", "NonText", "EndOfBuffer" }) do
  vim.api.nvim_set_hl(0, group, { bg = "NONE" })
end

vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#EEEEEE' })
