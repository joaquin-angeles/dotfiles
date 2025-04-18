require("neo-tree").setup({
    close_if_last_window = true,
    popup_border_style = "rounded",
    sources = { "filesystem", "buffers", "git_status" },
    filesystem = {
        follow_current_file = { enabled = true },
        hijack_netrw_behavior = "open_default",
        filtered_items = {
            visible = false,
            hide_dotfiles = true,
        },
        window = {
            position = "float",
            mappings = {
                ["."] = "toggle_hidden",
            },
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

vim.api.nvim_set_hl(0, "NeoTreeDirectoryIcon", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#5f7a7f", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeFileNameOpened", { fg = "#eeeeee", bold = true })
vim.api.nvim_set_hl(0, "NeoTreeCursorLine", { fg = "#1c1c1c", bg = "#5f7a7f" })
vim.api.nvim_set_hl(0, "NeoTreeCursorLineFile", { fg = "#1c1c1c", bg = "#eeeeee" })
vim.api.nvim_set_hl(0, "NeoTreeFileIcon", { fg = "#eeeeee" })
