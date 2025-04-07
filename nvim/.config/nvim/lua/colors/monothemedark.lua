local set = vim.api.nvim_set_hl

local colors = {
  red            = "#865054",     -- Used for keywords
  green          = "#5f7a5f",     -- Used for strings
  yellow         = "#a4965f",     -- Used for types, constants, etc.
  blue           = "#5f7a8c",     -- Used for functions, methods, etc.
  magenta        = "#75607a",     -- Used for variables
  cyan           = "#5f7a7f",     -- Used for booleans, operators
  bright_red     = "#976061",     -- Used for booleans
  bright_green   = "#729a72",     -- Used for constants
  bright_yellow  = "#a49a72",     -- Used for numbers
  bright_blue    = "#72949a",     -- Used for keywords, titles
  bright_magenta = "#8c729a",     -- Used for functions, methods
  bright_cyan    = "#729a96",     -- Used for types
  bright_black   = "#666666",     -- Used for comments, delimiters
  fg             = "#eeeeee",     -- Foreground text
}

-- Standard syntax groups (Neovim's typical color assignments)
set(0, "Comment",    { fg = colors.bright_black, italic = true })        -- Comments (dark gray)
set(0, "String",     { fg = colors.green })                             -- Strings (green)
set(0, "Function",   { fg = colors.blue })                              -- Functions (blue)
set(0, "Keyword",    { fg = colors.red, bold = true })                  -- Keywords (red)
set(0, "Identifier", { fg = colors.magenta })                          -- Variables (magenta)
set(0, "Number",     { fg = colors.bright_yellow })                     -- Numbers (bright yellow)
set(0, "Boolean",    { fg = colors.bright_red })                        -- Booleans (bright red)
set(0, "Type",       { fg = colors.yellow })                            -- Types (yellow)
set(0, "Operator",   { fg = colors.fg })                                -- Operators (white)
set(0, "Constant",   { fg = colors.bright_green })                      -- Constants (bright green)
set(0, "PreProc",    { fg = colors.cyan })                              -- Preprocessor directives (cyan)
set(0, "Title",      { fg = colors.bright_blue })                       -- Titles (bright blue)

-- Treesitter highlight groups (apply your colors to these as well)
set(0, "@comment",            { link = "Comment" })
set(0, "@string",             { link = "String" })
set(0, "@number",             { link = "Number" })
set(0, "@boolean",            { link = "Boolean" })
set(0, "@float",              { link = "Number" })
set(0, "@keyword",            { link = "Keyword" })
set(0, "@keyword.return",     { link = "Keyword" })
set(0, "@operator",           { link = "Operator" })
set(0, "@function",           { link = "Function" })
set(0, "@function.builtin",   { fg = colors.bright_blue, bold = true })
set(0, "@method",             { link = "Function" })
set(0, "@constructor",        { fg = colors.yellow })
set(0, "@variable",           { fg = colors.fg })
set(0, "@variable.builtin",   { fg = colors.red, italic = true })
set(0, "@type",               { link = "Type" })
set(0, "@type.builtin",       { fg = colors.cyan, italic = true })
set(0, "@class",              { fg = colors.yellow })
set(0, "@interface",          { fg = colors.bright_blue })
set(0, "@property",           { fg = colors.magenta })
set(0, "@field",              { fg = colors.green })
set(0, "@punctuation",        { fg = colors.bright_black })
set(0, "@punctuation.delimiter", { fg = colors.bright_black })
set(0, "@punctuation.bracket",   { fg = colors.bright_black })
set(0, "@tag",                { fg = colors.red })
set(0, "@tag.attribute",      { fg = colors.yellow })
set(0, "@tag.delimiter",      { fg = colors.bright_black })

return colors
