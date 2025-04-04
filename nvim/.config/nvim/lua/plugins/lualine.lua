return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- If using icons
  config = function()
    require("lualine").setup({
      options = { theme = "auto" }
    })
  end
}
