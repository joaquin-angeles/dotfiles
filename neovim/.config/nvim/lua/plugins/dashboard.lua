return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
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

    -- Highlight settings
    vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#5f7a5f" })
    vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#5f5f5f" })

    -- Dashboard header
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

    -- Dashboard buttons
    dashboard.section.buttons.val = {
      (function() local b = dashboard.button("f", "  Find File", "<cmd>Telescope find_files hidden=true cwd=~/<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("n", "  New File", "<cmd>enew | startinsert<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("r", "  Recent Files", "<cmd>Telescope oldfiles<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("/", "󱎸  Find Text", "<cmd>Telescope live_grep<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("c", "󰢻  Config", "<cmd>Lf ~/.config/nvim/<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("s", "  Restore Session", "<cmd>SessionRestore<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("l", "󰒲  Lazy", "<cmd>Lazy<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
      (function() local b = dashboard.button("Q", "  Quit", "<cmd>qa<CR>"); b.opts.hl_shortcut="AlphaShortcut"; return b end)(),
    }

    -- Footer function
    local function footer()
      local stats = require("lazy").stats()
      local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
      return "󱐋 Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
    end
    dashboard.section.footer.val = footer()

    -- Dashboard layout
    dashboard.opts.layout = {
      { type = "padding", val = 8 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 2 },
      dashboard.section.footer,
    }

    -- Load alpha after UI is ready
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        alpha.setup(dashboard.opts)
      end,
    })

    -- Hide lualine when alpha is open
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "alpha",
      callback = function()
        vim.opt.laststatus = 0
      end,
    })

    -- Restore lualine after leaving alpha
    vim.api.nvim_create_autocmd("BufUnload", {
      pattern = "*",
      callback = function()
        if vim.bo.filetype == "alpha" then
          vim.opt.laststatus = 3
        end
      end,
    })

    -- Update footer after all lazy-loaded plugins
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
