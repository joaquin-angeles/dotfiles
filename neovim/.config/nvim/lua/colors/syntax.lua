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
    bright_cyan    = "#729a96",
    bright_orange  = "#926e3f",
    bright_black   = "#404040",
    bright_gray    = "#505050",
    fg             = "#eeeeee"
}

-- Standard Vim highlight groups
set(0, "Comment",      { fg = colors.bright_black, italic = true })
set(0, "String",       { fg = colors.green })
set(0, "Function",     { fg = colors.blue })
set(0, "Keyword",      { fg = colors.bright_orange, bold = true, italic = true })
set(0, "Float",        { fg = colors.yellow })
set(0, "Identifier",   { fg = colors.red })
set(0, "Number",       { fg = colors.bright_yellow })
set(0, "Boolean",      { fg = colors.red })
set(0, "Type",         { fg = colors.green })
set(0, "Operator",     { fg = colors.red })
set(0, "Constant",     { fg = colors.yellow })
set(0, "PreProc",      { fg = colors.yellow })
set(0, "Title",        { fg = colors.orange })

-- Tree-sitter highlight groups (aligned with standard groups where applicable)
-- Core syntax elements
set(0, "@comment",             { link = "Comment" }) -- Links to standard Comment
set(0, "@string",              { link = "String" }) -- Links to standard String
set(0, "@string.escape",       { fg = colors.bright_green, italic = true }) -- Escape sequences in strings
set(0, "@number",              { link = "Number" }) -- Links to standard Number
set(0, "@boolean",             { link = "Boolean" }) -- Links to standard Boolean
set(0, "@float",               { link = "Number" }) -- Links to standard Number (same as Float)
set(0, "@keyword",             { link = "Keyword" }) -- Links to standard Keyword
set(0, "@keyword.function",    { fg = colors.bright_orange, bold = true }) -- Function keywords (e.g., 'function' in JS)
set(0, "@keyword.operator",    { fg = colors.red }) -- Operator keywords (e.g., 'instanceof')
set(0, "@keyword.return",      { link = "Keyword" }) -- Return statements
set(0, "@operator",            { link = "Operator" }) -- Links to standard Operator
set(0, "@function",            { link = "Function" }) -- Links to standard Function
set(0, "@function.builtin",    { fg = colors.bright_blue, bold = true }) -- Built-in functions (e.g., print)
set(0, "@function.call",       { fg = colors.blue }) -- Function calls
set(0, "@method",              { link = "Function" }) -- Links to standard Function
set(0, "@method.call",         { fg = colors.blue }) -- Method calls
set(0, "@constructor",         { fg = colors.yellow }) -- Constructors (e.g., new Class())
set(0, "@variable",            { fg = colors.fg }) -- Variables (default foreground)
set(0, "@variable.builtin",    { fg = colors.red, italic = true }) -- Built-in variables (e.g., this, self)
set(0, "@parameter",           { fg = colors.bright_red, italic = true }) -- Function parameters
set(0, "@type",                { link = "Type" }) -- Links to standard Type
set(0, "@type.builtin",        { fg = colors.cyan, italic = true }) -- Built-in types (e.g., int, string)
set(0, "@class",               { fg = colors.yellow }) -- Class definitions
set(0, "@interface",           { fg = colors.bright_blue }) -- Interface definitions
set(0, "@property",            { fg = colors.magenta }) -- Object properties
set(0, "@field",               { fg = colors.green }) -- Struct/class fields
set(0, "@constant",            { link = "Constant" }) -- Links to standard Constant
set(0, "@constant.builtin",    { fg = colors.yellow, bold = true }) -- Built-in constants (e.g., None, null)

-- Punctuation and delimiters
set(0, "@punctuation",         { fg = colors.bright_black })
set(0, "@punctuation.delimiter", { fg = colors.bright_black }) -- Commas, semicolons
set(0, "@punctuation.bracket", { fg = colors.bright_black }) -- Parentheses, braces
set(0, "@punctuation.special", { fg = colors.bright_gray }) -- Special punctuation (e.g., format specifiers)

-- Tags (e.g., HTML, XML)
set(0, "@tag",                 { fg = colors.red }) -- Tag names
set(0, "@tag.attribute",       { fg = colors.yellow }) -- Tag attributes
set(0, "@tag.delimiter",       { fg = colors.bright_black }) -- Tag delimiters (<, >)

-- Additional Tree-sitter groups for control flow and more
set(0, "@conditional",         { fg = colors.bright_orange, bold = true, italic = true }) -- if, else
set(0, "@repeat",             { fg = colors.bright_orange, bold = true, italic = true }) -- for, while
set(0, "@exception",           { fg = colors.red, bold = true }) -- try, catch
set(0, "@include",             { fg = colors.yellow }) -- import, include
set(0, "@label",              { fg = colors.cyan }) -- Labels (e.g., case, goto)
set(0, "@namespace",           { fg = colors.bright_blue }) -- Namespaces/modules
set(0, "@attribute",           { fg = colors.yellow }) -- Annotations/attributes (e.g., @decorator)
set(0, "@text",               { fg = colors.fg }) -- Plain text (e.g., in markdown)
set(0, "@text.title",          { fg = colors.orange, bold = true }) -- Headings (e.g., markdown)
set(0, "@text.literal",        { fg = colors.green }) -- Literal text (e.g., markdown code)
set(0, "@text.strong",         { fg = colors.fg, bold = true }) -- Bold text
set(0, "@text.emphasis",       { fg = colors.fg, italic = true }) -- Italic text
set(0, "@text.uri",            { fg = colors.cyan, underline = true }) -- URLs

-- Language-specific (optional, can be overridden per language)
set(0, "@string.regex",        { fg = colors.bright_green }) -- Regular expressions
set(0, "@module",             { fg = colors.bright_blue }) -- Modules/packages
set(0, "@variable.global",     { fg = colors.red }) -- Global variables
