return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = false,
                disabled_filetypes = { 'alpha', 'neo-tree' },
                component_separators = { left = '::', right = '::' },
                theme = {
                    normal = {
                        a = { fg = '#dfdfdf', bg = '#353535' },
                        b = { fg = '#dfdfdf', bg = '#252525' },
                        c = { bg = 'NONE' }
                    },
                    insert = {
                        a = { fg = '#729a72', bg = '#353535' },
                        b = { fg = '#dfdfdf', bg = '#252525' },
                        c = { bg = 'NONE' },
                    },

                    visual = {
                        a = { fg = '#5F7A5F', bg = '#353535' },
                        b = { fg = '#dfdfdf', bg = '#252525' },
                        c = { bg = 'NONE' },
                    },

                    replace = {
                        a = { fg = '#976061', bg = '#353535' },
                        b = { fg = '#dfdfdf', bg = '#252525' },
                        c = { bg = 'NONE' },
                    },

                    command = {
                        a = { fg = '#a49a72', bg = '#353535' },
                        b = { fg = '#dfdfdf', bg = '#252525' },
                        c = { bg = 'NONE' },
                    },

                    inactive = {
                        a = { fg = '#909090', bg = '#1c1c1c' },
                        b = { fg = '#909090', bg = '#1c1c1c' },
                        c = { bg = 'NONE' },
                    },
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' }
                    }
                },
                lualine_b = {
                    'branch'
                },
                lualine_c = {
                    'filename',
                    'filetype'
                },
                lualine_x = {
                    'diff',
                },
                lualine_y = {
                    '%p%%'
                },
                lualine_z = {
                    {
                        'location',
                        separator = { left = '', right = '' }
                    }
                }
            },
        })
    end
}
