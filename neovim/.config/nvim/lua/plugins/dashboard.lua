return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local status_ok, alpha = pcall(require, "alpha")
        if not status_ok then
            vim.notify("Alpha-nvim failed to load!", vim.log.levels.ERROR)
            return
        end

        local status_dashboard, dashboard = pcall(require, "alpha.themes.dashboard")
        if not status_dashboard then
            vim.notify("Alpha dashboard theme failed to load!", vim.log.levels.ERROR)
            return
        end

        vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#5f7a5f" })

        dashboard.section.header.val = {
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████  ",
            "                                                                        ",
        }

        dashboard.section.header.opts.hl = "AlphaHeader"

        dashboard.section.buttons.val = {
            dashboard.button("/", "  Find File", "<cmd>Telescope find_files hidden=true cwd=~/<CR>"),
            dashboard.button("n", "  New File", "<cmd>enew | startinsert<CR>"),
            dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"),
            dashboard.button("g", "󱎸  Find Text", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("c", "󰢻  Config", "<cmd>Neotree filesystem reveal dir=~/.config/nvim<CR>"),
            dashboard.button("s", "  Restore Session", "<cmd>SessionRestore<CR>"),
            dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"),
            dashboard.button("Q", "  Quit", "<cmd>qa<CR>"),
        }

        local function footer()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
            return "󱐋 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        end

        dashboard.section.footer.val = footer()

        dashboard.opts.layout = {
            { type = "padding", val = 8 },
            dashboard.section.header,
            { type = "padding", val = 2 },
            dashboard.section.buttons,
            { type = "padding", val = 2 },
            dashboard.section.footer,
        }

        alpha.setup(dashboard.opts)

        -- Optional: Update stats after everything has loaded
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy", -- triggered after all lazy-loaded plugins finish
            callback = function()
                dashboard.section.footer.val = footer()
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
    end,
}

