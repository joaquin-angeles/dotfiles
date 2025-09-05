vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.statuscolumn = "%s%l "
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.fillchars = { eob = " " }
vim.opt.clipboard = "unnamedplus"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", extends = ">", precedes = "<" }

-- Indentation
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
require'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    indent = { enable = true },
}

-- Persistent undo
local undodir = vim.fn.stdpath("cache") .. "/nvim/undodir"
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p")
end
vim.opt.undofile = true
vim.opt.undodir = undodir

-- Cursor appearance
vim.opt.guicursor = {
    "n-v-c:block",
    "i-ci-ve:block-blinkwait100-blinkon500-blinkoff500",
    "r-cr:hor20-blinkwait100-blinkon500-blinkoff500",
    "o:hor50-blinkwait100-blinkon500-blinkoff500"
}

-- Reset cursor on exit to avoid terminal cursor issues
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    callback = function()
        vim.opt.guicursor = { "a:block" }
    end
})
