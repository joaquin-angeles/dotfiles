local set = vim.api.nvim_set_hl

local colors = {
    red            = "#865054",
    green          = "#5f7a5f",
    yellow         = "#a4965f",
    blue           = "#5f7a8c",
    magenta        = "#75607a",
    cyan           = "#5f7a7f",
    orange         = "#c97c3e",
    bright_red     = "#b85757",
    bright_green   = "#729a72",
    bright_yellow  = "#a49a72",
    bright_blue    = "#72949a",
    bright_magenta = "#8c729a",
    bright_orange  = "#926e3f",
    bright_black   = "#404040",
    bright_gray    = "#505050",
    fg             = "#eeeeee"
}

-- Standard (VSCode-inspired)
set(0, "Comment",    { fg = colors.bright_gray, italic = true })
set(0, "String",     { fg = colors.green })
set(0, "Function",   { fg = colors.bright_blue })
set(0, "Keyword",    { fg = colors.bright_orange, bold = true })
set(0, "Float",      { fg = colors.bright_yellow })
set(0, "Identifier", { fg = colors.red })
set(0, "Number",     { fg = colors.bright_yellow })
set(0, "Boolean",    { fg = colors.red })
set(0, "Type",       { fg = colors.bright_blue })
set(0, "Operator",   { fg = colors.red })
set(0, "Constant",   { fg = colors.yellow })
set(0, "PreProc",    { fg = colors.yellow })
set(0, "Title",      { fg = colors.orange })

-- Tree-sitter core (VSCode-inspired)
set(0, "@comment",           { link = "Comment" })
set(0, "@string",            { link = "String" })
set(0, "@string.escape",     { fg = colors.bright_green, italic = true })
set(0, "@number",            { link = "Number" })
set(0, "@float",             { link = "Float" })
set(0, "@boolean",           { link = "Boolean" })
set(0, "@keyword",           { link = "Keyword" })
set(0, "@keyword.function",  { fg = colors.bright_orange, bold = true })
set(0, "@keyword.return",    { fg = colors.bright_orange, italic = true })
set(0, "@operator",          { link = "Operator" })
set(0, "@function",          { link = "Function" })
set(0, "@function.builtin",  { fg = colors.bright_blue })
set(0, "@function.call",     { link = "Function" })
set(0, "@constructor",       { fg = colors.yellow })
set(0, "@method",            { link = "Function" })
set(0, "@method.call",       { link = "Function" })
set(0, "@variable",          { fg = colors.fg })
set(0, "@variable.builtin",  { fg = colors.red })
set(0, "@parameter",         { fg = colors.fg, italic = true })
set(0, "@type",              { link = "Type" })
set(0, "@type.builtin",      { fg = colors.yellow })
set(0, "@class",             { fg = colors.bright_blue })
set(0, "@interface",         { fg = colors.bright_blue })
set(0, "@property",          { fg = colors.cyan })
set(0, "@field",             { fg = colors.bright_yellow })
set(0, "@constant",          { link = "Constant" })
set(0, "@constant.builtin",  { fg = colors.cyan })

-- Punctuation
set(0, "@punctuation",            { fg = colors.bright_black })
set(0, "@punctuation.delimiter",  { fg = colors.bright_black })
set(0, "@punctuation.bracket",    { fg = colors.bright_black })
set(0, "@punctuation.special",    { fg = colors.bright_gray })

-- Tags (VSCode-inspired)
set(0, "@tag",             { fg = colors.red })
set(0, "@tag.attribute",   { fg = colors.yellow })
set(0, "@tag.delimiter",   { fg = colors.bright_black })

-- Control flow (VSCode-inspired)
set(0, "@conditional",     { fg = colors.orange, bold = true })
set(0, "@repeat",          { fg = colors.orange })
set(0, "@exception",       { fg = colors.red, bold = true })
set(0, "@include",         { fg = colors.yellow })
set(0, "@label",           { fg = colors.cyan })
set(0, "@namespace",       { fg = colors.bright_blue })
set(0, "@attribute",       { fg = colors.bright_orange })

-- Text (Markdown-like)
set(0, "@text",            { fg = colors.fg })
set(0, "@text.title",      { fg = colors.orange, bold = true })
set(0, "@text.literal",    { fg = colors.green })
set(0, "@text.strong",     { fg = colors.fg, bold = true })
set(0, "@text.emphasis",   { fg = colors.fg, italic = true })
set(0, "@text.uri",        { fg = colors.cyan, underline = true })

-- Misc
set(0, "@string.regex",    { fg = colors.bright_green })
set(0, "@module",          { fg = colors.bright_blue })
set(0, "@variable.global", { fg = colors.red })
