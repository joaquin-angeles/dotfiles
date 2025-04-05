-- ~/.config/nvim/lua/config/plugins/snacks.lua

return {
  dashboard = {
    enabled = false,
    preset = {
	header = [[
        ████ ██████           █████      ██                     
       ███████████             █████                             
       █████████ ███████████████████ ███   ███████████   
      █████████  ███    █████████████ █████ ██████████████   
     █████████ ██████████ █████████ █████ █████ ████ █████   
   ███████████ ███    ███ █████████ █████ █████ ████ █████  
  ██████  █████████████████████ ████ █████ █████ ████ ██████  
       ]],
    keys = {
      { icon = "󰈞", key = "f", desc = "Find File", action = ":Telescope find_files hidden=true cwd=~/<CR>" },
      { icon = "󰅼", key = "n", desc = "New File", action = ":enew" },
      { icon = "󰍉", key = "g", desc = "Grep Text", action = ":Telescope live_grep<CR>" },
      { icon = "󰐾", key = "r", desc = "Recent File", action = ":Telescope oldfiles<CR>" },
      { icon = "", key = "c", desc = "Config", action = ":Neotree reveal left cwd=~/.config/nvim<CR>" },
      { icon = "󰒲", key = "s", desc = "Session", section = "session" },
      { icon = "󰓆", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
      { icon = "󰍉", key = "q", desc = "Quit", action = ":q!" },
    },
 }
},
  explorer = { enabled = false },
  indent = { enabled = true },
  input = { enabled = true },
  picker = { enabled = true },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  words = { enabled = true },
}

