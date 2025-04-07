require('lualine').setup({
    options = {
        disabled_filetypes = { 'alpha', 'neo-tree' },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = {
            normal = {
                a = { fg = '#1c1c1c', bg = '#b0b0b0' },
                b = { fg = '#eeeeee', bg = '#252525' },
                c = { bg = 'NONE' }
            },
            insert = { a = { fg = '#1c1c1c', bg = '#7a8f7a' }, b = { fg = '#eeeeee', bg = '#3a3a3a' }, c = { bg = 'NONE' } },
            visual = { a = { fg = '#1c1c1c', bg = '#d4b483' }, b = { fg = '#eeeeee', bg = '#3a3a3a' }, c = { bg = 'NONE' } },
            replace = { a = { fg = '#1c1c1c', bg = '#ff5f5f' }, b = { fg = '#eeeeee', bg = '#3a3a3a' }, c = { bg = 'NONE' } },
            command = { a = { fg = '#1c1c1c', bg = '#c17a47' }, b = { fg = '#eeeeee', bg = '#3a3a3a' }, c = { bg = 'NONE' } },
            inactive = { a = { fg = '#888888', bg = '#1c1c1c' }, b = { fg = '#888888', bg = '#1c1c1c' }, c = { bg = 'NONE' } },
        },
    },
    sections = {
        lualine_a = { { 'mode', fmt = function(str) return ' ' .. str end } },
        lualine_b = { 'filename' },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location' },
            { function() return ' ' .. os.date('%I:%M %p') end },
        },
    },
})

vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight StatusLineNC guibg=NONE")
