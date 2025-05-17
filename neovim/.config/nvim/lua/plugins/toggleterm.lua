return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      shade_terminals = false, -- Disable shading to avoid background color
      highlights = {
        Normal = {
          guibg = "NONE", -- Set terminal background to transparent
        },
        NormalFloat = {
          guibg = "NONE", -- Ensure floating windows are transparent
        },
      },
    })

    -- Enable true colors
    vim.opt.termguicolors = true

    -- Optional: Ensure terminal buffer has transparent background
    vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", fg = "#eeeeee" })
    vim.api.nvim_set_hl(0, "TermCursor", { bg = "NONE", fg = "#eeeeee" })

    -- Your custom ANSI color palette (unchanged)
    vim.g.terminal_color_0 = "#353535"
    vim.g.terminal_color_1 = "#865054"
    vim.g.terminal_color_2 = "#5f7a5f"
    vim.g.terminal_color_3 = "#a4965f"
    vim.g.terminal_color_4 = "#5f7a8c"
    vim.g.terminal_color_5 = "#75607a"
    vim.g.terminal_color_6 = "#6a8b8b"
    vim.g.terminal_color_7 = "#eeeeee"
    vim.g.terminal_color_8 = "#666666"
    vim.g.terminal_color_9 = "#976061"
    vim.g.terminal_color_10 = "#729a72"
    vim.g.terminal_color_11 = "#a49a72"
    vim.g.terminal_color_12 = "#72949a"
    vim.g.terminal_color_13 = "#8c729a"
    vim.g.terminal_color_14 = "#729a96"
    vim.g.terminal_color_15 = "#f1f1f1"
  end,
}
