-- Highlight on yank
vim.api.nvim_create_augroup('YankNotify', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'YankNotify',
  pattern = '*',
  callback = function()
    local num_lines = math.max(1, vim.fn.line("'>") - vim.fn.line("'<") + 1)
    vim.notify(num_lines .. ' line(s) yanked to clipboard.', vim.log.levels.INFO, { timeout = 1000 })
  end,
})

