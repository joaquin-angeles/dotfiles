local set = vim.api.nvim_set_hl

local colors = {
    red            = "#865054",
    green          = "#5f7a5f",
    yellow         = "#a4965f",
    orange         = "#b37f5f",
    blue           = "#5f7a8c",
    magenta        = "#75607a",
    cyan           = "#5f7a7f",
    fg             = "#eeeeee",
    gray           = "#505050",
    bright_red     = "#976061",
    bright_green   = "#729a72",
    bright_yellow  = "#a49a72",
    bright_orange  = "#d4a27a",
    bright_blue    = "#72949a",
    bright_magenta = "#8c729a",
    bright_cyan    = "#729a96",
    bright_fg      = "#f1f1f1",
}

-- Standard Vim highlight groups
local standard_highlights = {
    Boolean   = { fg = colors.red },
    Comment   = { fg = colors.gray, italic = true },
    Constant  = { fg = colors.yellow },
    Float     = { fg = colors.bright_yellow },
    Function  = { fg = colors.bright_blue },
    Identifier= { fg = colors.cyan },
    Keyword   = { fg = colors.orange, bold = true },
    Number    = { fg = colors.bright_magenta },
    Operator  = { fg = colors.red },
    PreProc   = { fg = colors.yellow },
    String    = { fg = colors.green },
    Title     = { fg = colors.magenta },
    Type      = { fg = colors.bright_blue },
}

-- Tree-sitter highlight groups
local ts_highlights = {
    -- Syntax
    ["@attribute"]          = { fg = colors.bright_red },
    ["@boolean"]            = { link = "Boolean" },
    ["@class"]              = { fg = colors.bright_blue },
    ["@comment"]            = { link = "Comment" },
    ["@conditional"]        = { fg = colors.bright_red, bold = true },
    ["@constant"]           = { link = "Constant" },
    ["@constant.builtin"]   = { fg = colors.yellow },
    ["@constructor"]        = { fg = colors.yellow },
    ["@exception"]          = { fg = colors.red, bold = true },
    ["@field"]              = { fg = colors.bright_yellow },
    ["@float"]              = { link = "Float" },
    ["@function"]           = { link = "Function" },
    ["@function.builtin"]   = { fg = colors.bright_blue },
    ["@function.call"]      = { link = "Function" },
    ["@include"]            = { fg = colors.yellow },
    ["@interface"]          = { fg = colors.bright_blue },
    ["@keyword"]            = { link = "Keyword" },
    ["@keyword.function"]   = { fg = colors.bright_red, bold = true },
    ["@keyword.return"]     = { fg = colors.bright_red, italic = true },
    ["@label"]              = { fg = colors.cyan },
    ["@method"]             = { link = "Function" },
    ["@method.call"]        = { link = "Function" },
    ["@module"]             = { fg = colors.bright_blue },
    ["@namespace"]          = { fg = colors.bright_blue },
    ["@number"]             = { link = "Number" },
    ["@operator"]           = { link = "Operator" },
    ["@parameter"]          = { fg = colors.bright_cyan, italic = true },
    ["@property"]           = { fg = colors.cyan },
    ["@punctuation"]        = { fg = colors.gray },
    ["@punctuation.bracket"]= { fg = colors.gray },
    ["@punctuation.delimiter"] = { fg = colors.gray },
    ["@punctuation.special"]= { fg = colors.bright_fg },
    ["@repeat"]             = { fg = colors.magenta },
    ["@string"]             = { link = "String" },
    ["@string.escape"]      = { fg = colors.bright_yellow, italic = true },
    ["@string.regex"]       = { fg = colors.bright_green },
    ["@tag"]                = { fg = colors.red },
    ["@tag.attribute"]      = { fg = colors.bright_orange },
    ["@tag.delimiter"]      = { fg = colors.gray },
    ["@text"]               = { fg = colors.fg },
    ["@text.emphasis"]      = { fg = colors.fg, italic = true },
    ["@text.literal"]       = { fg = colors.green },
    ["@text.strong"]        = { fg = colors.fg, bold = true },
    ["@text.title"]         = { fg = colors.orange, bold = true },
    ["@text.uri"]           = { fg = colors.cyan, underline = true },
    ["@type"]               = { link = "Type" },
    ["@type.builtin"]       = { fg = colors.yellow },
    ["@variable"]           = { fg = colors.fg },
    ["@variable.builtin"]   = { fg = colors.red },
    ["@variable.global"]    = { fg = colors.red },
}

-- Apply all highlight groups
for group, opts in pairs(standard_highlights) do
    set(0, group, opts)
end

for group, opts in pairs(ts_highlights) do
    set(0, group, opts)
end
