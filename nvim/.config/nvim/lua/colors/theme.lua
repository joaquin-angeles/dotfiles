local theme = {}

-- Setup colors
local colors = {
  bg = "#1c1c1c",
  fg = "#eeeeee",
  cursor = "#eeeeee",
  cursor_text = "#1c1c1c",
  selection_fg = "#3e3e3e",
  selection_bg = "#c1ddff",
  black = "#252525",
  bright_black = "#555555",
  red = "#be7472",
  bright_red = "#ff9900",
  green = "#709772",
  bright_green = "#97bb98",
  yellow = "#989772",
  bright_yellow = "#fefdbc",
  blue = "#708090",
  bright_blue = "#9fbdde",
  magenta = "#727399",
  bright_magenta = "#989abc",
  cyan = "#719899",
  bright_cyan = "#6fbbbc",
  white = "#7f7f7f",
  bright_white = "#feffff"
}

-- Apply highlights
theme.setup = function()
  vim.cmd("hi Normal guifg=" .. colors.fg .. " guibg=" .. colors.bg)
  vim.cmd("hi Comment guifg=" .. colors.bright_black)
  vim.cmd("hi String guifg=" .. colors.bright_green)
  vim.cmd("hi Keyword guifg=" .. colors.bright_red)
  vim.cmd("hi Function guifg=" .. colors.bright_blue)
  vim.cmd("hi Identifier guifg=" .. colors.fg)
  vim.cmd("hi Type guifg=" .. colors.bright_cyan)
  vim.cmd("hi Constant guifg=" .. colors.bright_yellow)
  vim.cmd("hi Number guifg=" .. colors.red)
  vim.cmd("hi Operator guifg=" .. colors.bright_magenta)
  vim.cmd("hi Punctuation guifg=" .. colors.white)
  vim.cmd("hi Error guifg=" .. colors.red)
  vim.cmd("hi Warning guifg=" .. colors.bright_red)
  vim.cmd("hi Info guifg=" .. colors.bright_blue)
  vim.cmd("hi Hint guifg=" .. colors.green)
  vim.cmd("hi Cursor guifg=" .. colors.cursor_text .. " guibg=" .. colors.cursor)
  vim.cmd("hi Visual guifg=" .. colors.selection_fg .. " guibg=" .. colors.selection_bg)
end

return theme

