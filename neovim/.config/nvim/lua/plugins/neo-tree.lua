return {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require("neo-tree").setup({
            popup_border_style = "rounded",
            close_if_last_window = true,
            sources = { "filesystem", "buffers", "git_status" },
            window = {
                position = "float",
                hide_cursor = true,
            },
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    visible = false,
                    hide_dotfiles = true,
                },
                window = {
                    width = "100%",
                    mappings = {
                        ["."] = "toggle_hidden",
                    },
                    hide_cursor = true,
                },
            },
            default_component_configs = {
                window = {
                    width = vim.o.columns,
                    height = vim.o.lines - 2,
                },
            },
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end,
                },
            },
        })
    end
}
