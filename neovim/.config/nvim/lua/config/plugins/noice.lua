require("noice").setup({
  routes = {
    {
      filter = {
        event = "cmdline",
        cond = function()
          return vim.bo.filetype == "alpha"
        end,
      },
      opts = { skip = true },
    },
  },
})
