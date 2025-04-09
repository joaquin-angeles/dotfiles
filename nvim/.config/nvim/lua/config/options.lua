vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.cursorline = true
vim.cmd("hi CursorLine guibg=#242424 ctermbg=NONE")
vim.cmd("hi CursorLineNr guifg=#eeeeee gui=bold ctermfg=255 cterm=bold")

-- Function to check if the buffer is empty
local function is_empty_buffer()
  return vim.fn.line('$') == 1 and vim.fn.getline(1) == ''
end

for _, mode in ipairs({ "n", "i", "v" }) do
  vim.keymap.set(mode, "<F13>", "<Esc>", { noremap = true, silent = true })
end

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
