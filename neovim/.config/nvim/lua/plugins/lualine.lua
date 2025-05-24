return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require('lualine').setup({
            options = {
                icons_enabled = false,
                disabled_filetypes = { 'alpha', 'neo-tree' },
                section_separators = { left = '', right = '' },
                component_separators = { left = '::', right = '::' },
                theme = {
                    normal = {
                        a = { fg = '#eeeeee', bg = '#3f4044' },
                        b = { fg = '#eeeeee', bg = '#2a2a2e' },
                        c = { bg = 'NONE' }
                    },
                    insert = {
                        a = { fg = '#eeeeee', bg = '#5f7a5f' },
                        b = { fg = '#eeeeee', bg = '#2a2a2e' },
                        c = { bg = 'NONE' },
                    },

                    visual = {
                        a = { fg = '#1e1e20', bg = '#7a8a4f' },
                        b = { fg = '#eeeeee', bg = '#2a2a2e' },
                        c = { bg = 'NONE' },
                    },

                    replace = {
                        a = { fg = '#1e1e20', bg = '#865054' },
                        b = { fg = '#eeeeee', bg = '#2a2a2e' },
                        c = { bg = 'NONE' },
                    },

                    command = {
                        a = { fg = '#1e1e20', bg = '#a4965f' },
                        b = { fg = '#eeeeee', bg = '#2a2a2e' },
                        c = { bg = 'NONE' },
                    },

                    inactive = {
                        a = { fg = '#909090', bg = '#1e1e20' },
                        b = { fg = '#909090', bg = '#1e1e20' },
                        c = { bg = 'NONE' },
                    },
                },
            },
            sections = {
                lualine_a = {
                    {
                        'mode',
                        separator = { left = '', right = '' }
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
                        separator = { left = '', right = '' }
                    }
                }
            },
        })
    end
}
