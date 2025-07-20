local set = vim.api.nvim_set_hl

local colors = {
    red            = "#865054",
    green          = "#5f7a5f",
    yellow         = "#a4965f",
    orange         = "#b37f5f",
    blue           = "#5f7a8c",
    magenta        = "#75607a",
    cyan           = "#5f7a7f",
    fg             = "#dfdfdf",
    gray           = "#555557",
    bright_red     = "#976061",
    bright_green   = "#729a72",
    bright_yellow  = "#a49a72",
    bright_orange  = "#c6844a",
    bright_blue    = "#72949a",
    bright_magenta = "#8c729a",
    bright_cyan    = "#729a96",
    bright_fg      = "#f1f1f1",
}

local function standard_highlights()
    return {
        Boolean      = { fg = colors.red },
        Comment      = { fg = colors.gray, italic = true },
        Constant     = { fg = colors.yellow },
        Float        = { fg = colors.bright_yellow },
        Function     = { fg = colors.bright_blue },
        Identifier   = { fg = colors.cyan },
        Keyword      = { fg = colors.magenta, bold = true },
        Number       = { fg = colors.bright_yellow },
        Operator     = { fg = colors.red },
        PreProc      = { fg = colors.yellow },
        String       = { fg = colors.green },
        Title        = { fg = colors.yellow },
        Type         = { fg = colors.bright_blue },
        Error        = { fg = colors.bright_red, bold = true },
        Todo         = { fg = colors.bright_magenta, bold = true },
    }
end

local function ts_highlights()
    return {
        ["@attribute"]            = { fg = colors.bright_red },
        ["@boolean"]              = { link = "Boolean" },
        ["@class"]                = { fg = colors.bright_blue },
        ["@comment"]              = { link = "Comment" },
        ["@conditional"]          = { fg = colors.bright_red, bold = true },
        ["@constant"]             = { link = "Constant" },
        ["@constant.builtin"]     = { fg = colors.yellow },
        ["@constructor"]          = { fg = colors.yellow },
        ["@exception"]            = { fg = colors.red, bold = true },
        ["@field"]                = { fg = colors.bright_yellow },
        ["@float"]                = { link = "Float" },
        ["@function"]             = { link = "Function" },
        ["@function.builtin"]     = { fg = colors.bright_blue },
        ["@function.call"]        = { link = "Function" },
        ["@include"]              = { fg = colors.yellow },
        ["@interface"]            = { fg = colors.bright_blue },
        ["@keyword"]              = { link = "Keyword" },
        ["@keyword.function"]     = { fg = colors.bright_red, bold = true },
        ["@keyword.return"]       = { fg = colors.bright_red, italic = true },
        ["@label"]                = { fg = colors.cyan },
        ["@method"]               = { link = "Function" },
        ["@method.call"]          = { link = "Function" },
        ["@module"]               = { fg = colors.bright_blue },
        ["@namespace"]            = { fg = colors.bright_blue },
        ["@number"]               = { link = "Number" },
        ["@operator"]             = { link = "Operator" },
        ["@parameter"]            = { fg = colors.bright_cyan, italic = true },
        ["@property"]             = { fg = colors.cyan },
        ["@punctuation"]          = { fg = colors.gray },
        ["@punctuation.bracket"]  = { fg = colors.gray },
        ["@punctuation.delimiter"]= { fg = colors.gray },
        ["@punctuation.special"]  = { fg = colors.bright_fg },
        ["@repeat"]               = { fg = colors.yellow },
        ["@string"]               = { link = "String" },
        ["@string.escape"]        = { fg = colors.bright_yellow, italic = true },
        ["@string.regex"]         = { fg = colors.bright_green },
        ["@tag"]                  = { fg = colors.red },
        ["@tag.attribute"]        = { fg = colors.bright_orange },
        ["@tag.delimiter"]        = { fg = colors.gray },
        ["@text"]                 = { fg = colors.fg },
        ["@text.emphasis"]        = { fg = colors.fg, italic = true },
        ["@text.literal"]         = { fg = colors.green },
        ["@text.strong"]          = { fg = colors.fg, bold = true },
        ["@text.title"]           = { fg = colors.yellow, bold = true },
        ["@text.uri"]             = { fg = colors.cyan, underline = true },
        ["@type"]                 = { link = "Type" },
        ["@type.builtin"]         = { fg = colors.yellow },
        ["@variable"]             = { fg = colors.fg },
        ["@variable.builtin"]     = { fg = colors.red },
        ["@variable.global"]      = { fg = colors.red },
    }
end

local function apply_highlights()
    local standards = standard_highlights()
    local treesitter = ts_highlights()

    for group, opts in pairs(standards) do
        set(0, group, opts)
    end

    for group, opts in pairs(treesitter) do
        set(0, group, opts)
    end
end

apply_highlights()
