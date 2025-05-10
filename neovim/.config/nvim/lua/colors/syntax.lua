local set = vim.api.nvim_set_hl
local highlight = vim.highlight.create

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

-- Standard highlights
local standard_highlights = {
    Comment = { fg = colors.bright_gray, italic = true },
    String  = { fg = colors.green },
    Function = { fg = colors.bright_blue },
    Keyword = { fg = colors.bright_orange, bold = true },
    Float = { fg = colors.bright_yellow },
    Identifier = { fg = colors.red },
    Number = { fg = colors.bright_yellow },
    Boolean = { fg = colors.red },
    Type = { fg = colors.bright_blue },
    Operator = { fg = colors.red },
    Constant = { fg = colors.yellow },
    PreProc = { fg = colors.yellow },
    Title = { fg = colors.orange }
}

-- Apply standard highlights
for group, opts in pairs(standard_highlights) do
    set(0, group, opts)
end

-- Tree-sitter highlights
local ts_highlights = {
    ["@comment"] = { link = "Comment" },
    ["@string"] = { link = "String" },
    ["@string.escape"] = { fg = colors.bright_green, italic = true },
    ["@number"] = { link = "Number" },
    ["@float"] = { link = "Float" },
    ["@boolean"] = { link = "Boolean" },
    ["@keyword"] = { link = "Keyword" },
    ["@keyword.function"] = { fg = colors.bright_orange, bold = true },
    ["@keyword.return"] = { fg = colors.bright_orange, italic = true },
    ["@operator"] = { link = "Operator" },
    ["@function"] = { link = "Function" },
    ["@function.builtin"] = { fg = colors.bright_blue },
    ["@function.call"] = { link = "Function" },
    ["@constructor"] = { fg = colors.yellow },
    ["@method"] = { link = "Function" },
    ["@method.call"] = { link = "Function" },
    ["@variable"] = { fg = colors.fg },
    ["@variable.builtin"] = { fg = colors.red },
    ["@parameter"] = { fg = colors.fg, italic = true },
    ["@type"] = { link = "Type" },
    ["@type.builtin"] = { fg = colors.yellow },
    ["@class"] = { fg = colors.bright_blue },
    ["@interface"] = { fg = colors.bright_blue },
    ["@property"] = { fg = colors.cyan },
    ["@field"] = { fg = colors.bright_yellow },
    ["@constant"] = { link = "Constant" },
    ["@constant.builtin"] = { fg = colors.cyan },
    ["@punctuation"] = { fg = colors.bright_black },
    ["@punctuation.delimiter"] = { fg = colors.bright_black },
    ["@punctuation.bracket"] = { fg = colors.bright_black },
    ["@punctuation.special"] = { fg = colors.bright_gray },
    ["@tag"] = { fg = colors.red },
    ["@tag.attribute"] = { fg = colors.yellow },
    ["@tag.delimiter"] = { fg = colors.bright_black },
    ["@conditional"] = { fg = colors.orange, bold = true },
    ["@repeat"] = { fg = colors.orange },
    ["@exception"] = { fg = colors.red, bold = true },
    ["@include"] = { fg = colors.yellow },
    ["@label"] = { fg = colors.cyan },
    ["@namespace"] = { fg = colors.bright_blue },
    ["@attribute"] = { fg = colors.bright_orange },
    ["@text"] = { fg = colors.fg },
    ["@text.title"] = { fg = colors.orange, bold = true },
    ["@text.literal"] = { fg = colors.green },
    ["@text.strong"] = { fg = colors.fg, bold = true },
    ["@text.emphasis"] = { fg = colors.fg, italic = true },
    ["@text.uri"] = { fg = colors.cyan, underline = true },
    ["@string.regex"] = { fg = colors.bright_green },
    ["@module"] = { fg = colors.bright_blue },
    ["@variable.global"] = { fg = colors.red }
}

-- Apply Tree-sitter highlights
for group, opts in pairs(ts_highlights) do
    set(0, group, opts)
end
