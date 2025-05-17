return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false,
    opts = {
        filesystem = {
            filtered_items = {
                visible = false, -- start hidden files as hidden
                hide_dotfiles = true,
                hide_gitignored = true,
            },
            window = {
                mappings = {
                    ["."] = "toggle_hidden",
                },
            },
        },
    },
}
