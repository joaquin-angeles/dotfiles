local set = vim.api.nvim_set_hl
local colors = {
    red            = "#865054",
    bright_red     = "#976061",
    orange         = "#926e3f",
    green          = "#5f7a5f",
    bright_green   = "#729a72",
    yellow         = "#a4965f",
    bright_yellow  = "#a49a72",
    blue           = "#5f7a8c",
    bright_blue    = "#72949a",
    magenta        = "#75607a",
    bright_magenta = "#8c729a",
    cyan           = "#5f7a7f",
    bright_cyan    = "#729a96",
    black          = "#1c1c1c",
    bright_black   = "#444444"
}

-- Treesitter highlights
local ts_highlights = {
    -- Functions, methods, and identifiers
    ['@function'] = { fg = colors.blue },
    ['@function.builtin'] = { fg = colors.bright_blue },
    ['@method'] = { fg = colors.blue },
    ['@method.call'] = { fg = colors.bright_blue },

    -- Types and classes
    ['@type'] = { fg = colors.cyan },
    ['@class'] = { fg = colors.magenta },
    ['@interface'] = { fg = colors.blue },

    -- Keywords and operators
    ['@keyword'] = { fg = colors.orange },
    ['@keyword.operator'] = { fg = colors.orange },

    -- Comments and strings
    ['@comment'] = { fg = colors.bright_black, italic = true },
    ['@string'] = { fg = colors.magenta },
    ['@string.regex'] = { fg = colors.bright_magenta },

    -- Numbers and constants
    ['@number'] = { fg = colors.bright_yellow },
    ['@boolean'] = { fg = colors.bright_yellow },
    ['@constant'] = { fg = colors.yellow },

    -- Punctuation and operators
    ['@operator'] = { fg = colors.red },
    ['@punctuation'] = { fg = colors.bright_green },

    -- Error highlighting
    ['@error'] = { fg = colors.bright_red },

    -- Types and qualifiers
    ['@type.qualifier'] = { fg = colors.bright_cyan },

    -- Add custom highlight for specific keywords
    ['@keyword.local'] = { fg = colors.orange, italic = true },
    ['@keyword.source'] = { fg = colors.orange, italic = true },
}

-- Syntax highlights (regular Vim syntax highlighting)
set(0, 'Keyword', { fg = colors.orange })
set(0, 'Function', { fg = colors.blue })
set(0, 'Identifier', { fg = colors.green })
set(0, 'Type', { fg = colors.cyan })
set(0, 'String', { fg = colors.magenta })
set(0, 'Comment', { fg = colors.bright_black, italic = true })
set(0, 'Number', { fg = colors.bright_yellow })
set(0, 'Error', { fg = colors.bright_red, bg = colors.bright_black, bold = true })
set(0, 'Constant', { fg = colors.yellow })
set(0, 'Variable', { fg = colors.green })

-- Apply Treesitter highlights
for group, hl in pairs(ts_highlights) do
    set(0, group, hl)
end
