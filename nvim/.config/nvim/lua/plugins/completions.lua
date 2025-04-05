return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      { "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
      "roobert/tailwindcss-colorizer-cmp.nvim",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      require "config.completions"
    end,
  },
}

