return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Icons support
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
	
	vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#9ab69b" })

        -- Restore ASCII Art Header
        dashboard.section.header.val = {
            "       ████ ██████           █████      ██                     ",
            "      ███████████             █████                             ",
            "      █████████ ███████████████████ ███   ███████████   ",
            "     █████████  ███    █████████████ █████ ██████████████   ",
            "    █████████ ██████████ █████████ █████ █████ ████ █████   ",
            "  ███████████ ███    ███ █████████ █████ █████ ████ █████  ",
            " ██████  █████████████████████ ████ █████ █████ ████ ██████  ",
        }

	dashboard.section.header.opts.hl = "AlphaHeader"
	
        -- Set up buttons
	dashboard.section.buttons.val = {
    	dashboard.button("n", "  New File", ":ene<CR>"),  -- New File button
    	dashboard.button("r", "󰄉  Recent Files", ":Telescope oldfiles<CR>"),
    	dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
    	dashboard.button("/", "󰱼  Find Text", ":Telescope live_grep<CR>"),
    	dashboard.button("c", "  Config", ":Neotree filesystem reveal left dir=~/.config/nvim<CR>"),
    	dashboard.button("l", "󰒲  Lazy", ":Lazy<CR>"),
    	dashboard.button("q", "  Quit", ":qa<CR>"),
}

        -- Footer with plugin count and load time
        local function footer()
            local stats = require("lazy").stats()
            local ms = math.floor(stats.startuptime * 100) / 100
            return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        end
        dashboard.section.footer.val = footer()

	dashboard.opts.layout = {
    	{ type = "padding", val = 8 },  -- Adds space at the top
    dashboard.section.header,
    { type = "padding", val = 2 },  -- Space between header and buttons
    dashboard.section.buttons,
    { type = "padding", val = 2 },  -- Space between buttons and footer
    dashboard.section.footer,
}

        -- Apply the theme
        alpha.setup(dashboard.opts)
    end,
}

