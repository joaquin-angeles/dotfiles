return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = 1,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winblend = 0, -- Ensure full opacity
          winhighlight = "NormalFloat:Normal,FloatBorder:Normal",
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
    },
    routes = {
    },
  },
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
}
