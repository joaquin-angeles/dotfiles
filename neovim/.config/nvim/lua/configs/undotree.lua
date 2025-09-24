if vim.fn.has("persistent_undo") then
  local undodir = vim.fn.expand("~/.undodir")
  if not vim.fn.isdirectory(undodir) then
    vim.fn.mkdir(undodir, "p", 0700)
  end
  vim.o.undodir = undodir
  vim.o.undofile = true
end
