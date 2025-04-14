require('lualine').setup({
    options = {
        disabled_filetypes = { 'alpha', 'neo-tree' },
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        theme = {
            normal = {
                a = { fg = '#eeeeee', bg = '#404040' },
                b = { fg = '#eeeeee', bg = '#282828' },
                c = { bg = 'NONE' }
            },
            insert = { a = { fg = '#1c1c1c', bg = '#5f7a5f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
            visual = { a = { fg = '#1c1c1c', bg = '#d4b483' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
            replace = { a = { fg = '#1c1c1c', bg = '#ff5f5f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
            command = { a = { fg = '#1c1c1c', bg = '#926e3f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
            inactive = { a = { fg = '#888888', bg = '#1c1c1c' }, b = { fg = '#888888', bg = '#1c1c1c' }, c = { bg = 'NONE' } },
        },
    },
    sections = {
        lualine_a = {
            { 
                'mode',
                separator = { left = '', right = '' },
                fmt = function(str) return ' ' .. str end 
            } 
        },
        lualine_b = { 'filename' },
        lualine_c = {},
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
            { 'location' },
            { function() return ' ' .. os.date('%I:%M %p') end, separator = { right = '' } }
        }
    },
})

vim.cmd("highlight StatusLine guibg=NONE")
vim.cmd("highlight StatusLineNC guibg=NONE")
