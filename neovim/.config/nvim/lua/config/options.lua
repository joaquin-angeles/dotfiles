-- Indentations 
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- General options
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s%l "
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.cursorline = true

-- Define the undo directory path
local undodir = vim.fn.stdpath("cache") .. "/nvim/undodir"

-- Check if the directory exists; if not, create it
if vim.fn.isdirectory(undodir) == 0 then
  vim.fn.mkdir(undodir, "p", 0700)
end

-- Enable persistent undo and set the undo directory
vim.opt.undofile = true
vim.opt.undodir = undodir

-- Cursor adjustments
vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:block-blinkwait100-blinkon500-blinkoff500",
    "r-cr:hor20-blinkwait100-blinkon500-blinkoff500",
    "o:hor50-blinkwait100-blinkon500-blinkoff500"
}

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:block"
})
