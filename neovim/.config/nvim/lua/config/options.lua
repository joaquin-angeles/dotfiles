vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Cursor adjustments
vim.opt.guicursor = {
    "n-v-c:block-blinkwait100-blinkon500-blinkoff500",
    "i-ci-ve:ver25-blinkwait100-blinkon500-blinkoff500",
    "r-cr:hor20-blinkwait100-blinkon500-blinkoff500",
    "o:hor50-blinkwait100-blinkon500-blinkoff500"
}

vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "set guicursor=a:block"
})
