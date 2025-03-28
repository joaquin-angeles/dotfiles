return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Set the Lualine theme to 'lackluster'
      local custom_theme = require("lualine.themes.lackluster")

      -- Change status line background to #1c1c1c
      custom_theme.normal.c.bg = "#1c1c1c"
      custom_theme.insert.c.bg = "#1c1c1c"
      custom_theme.visual.c.bg = "#1c1c1c"
      custom_theme.replace.c.bg = "#1c1c1c"
      custom_theme.command.c.bg = "#1c1c1c"
      custom_theme.inactive.c.bg = "#1c1c1c"

      -- Change the "NORMAL" button color (text + background)
      custom_theme.normal.a.fg = "#1c1c1c" -- Text color
      custom_theme.normal.a.bg = "#eeeeee" -- Background color (example: red)

      opts.options.theme = custom_theme

      -- Configure the lualine_z section with a custom 12-hour clock format
      opts.sections.lualine_z = {
        function()
          return " " .. os.date("%I:%M %p")
        end,
      }
    end,
  },
}
