return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Remove any existing items from lualine_z (including the default clock)
      opts.sections.lualine_z = {}
      -- Append custom 12-hour format with AM/PM
      table.insert(opts.sections.lualine_z, function()
        return " " .. os.date("%I:%M %p")
      end)
    end,
  },
}
