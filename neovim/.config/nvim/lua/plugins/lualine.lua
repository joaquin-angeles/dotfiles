return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
        require('lualine').setup({
            options = {
                icons_enabled = false,
                disabled_filetypes = { 'alpha', 'neo-tree' },
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
                theme = {
                    normal = {
                        a = { fg = '#eeeeee', bg = '#404040' },
                        b = { fg = '#eeeeee', bg = '#282828' },
                        c = { bg = 'NONE' }
                    },
                    insert = { a = { fg = '#eeeeee', bg = '#5f7a5f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
                    visual = { a = { fg = '#1c1c1c', bg = '#a4965f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
                    replace = { a = { fg = '#1c1c1c', bg = '#ff5f5f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
                    command = { a = { fg = '#eeeeee', bg = '#926e3f' }, b = { fg = '#eeeeee', bg = '#282828' }, c = { bg = 'NONE' } },
                    inactive = { a = { fg = '#888888', bg = '#1c1c1c' }, b = { fg = '#888888', bg = '#1c1c1c' }, c = { bg = 'NONE' } },
                },
            },
            sections = {
                lualine_a = {
                    { 
                        'mode',
                        separator = { left = '', right = '' },
                    } 
                },
                lualine_b = {
                    'filename',
                    'filetype'
                },
                lualine_c = {
                    'branch'
                },
                lualine_x = {
                    'diff'
                },
                lualine_y = {
                    '%p%%',
                    'location'
                },
                lualine_z = {
                    { function() return '' .. os.date('%I:%M %p') end, separator = { left = '', right = '' } }
                }
            },
        })
  end
}
