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
                        a = { fg = '#d3d3d5', bg = '#333335' },
                        b = { fg = '#d3d3d5', bg = '#252527' },
                        c = { bg = 'NONE' }
                    },
                    insert = {
                        a = { fg = '#1e1e20', bg = '#5f7a5f' },
                        b = { fg = '#d3d3d5', bg = '#252527' },
                        c = { bg = 'NONE' },
                    },

                    visual = {
                        a = { fg = '#1e1e20', bg = '#7a8a4f' },
                        b = { fg = '#d3d3d5', bg = '#252527' },
                        c = { bg = 'NONE' },
                    },

                    replace = {
                        a = { fg = '#1e1e20', bg = '#865054' },
                        b = { fg = '#d3d3d5', bg = '#252527' },
                        c = { bg = 'NONE' },
                    },

                    command = {
                        a = { fg = '#1e1e20', bg = '#a4965f' },
                        b = { fg = '#d3d3d5', bg = '#252527' },
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
