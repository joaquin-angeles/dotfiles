return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		require('lualine').setup({
			options = {
                transparent = "true"
			},
		})
		-- vim.cmd.colorscheme("lackluster")
		vim.cmd.colorscheme("lackluster-hack")
		-- vim.cmd.colorscheme("lackluster-mint")
	end,
}
