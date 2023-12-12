return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local setup, colorscheme = pcall(require, "tokyonight")
		if not setup then
			vim.notify(colorscheme, vim.log.levels.ERROR)
			return
		end

		colorscheme.setup({
			style = "night",
		})

		vim.cmd.colorscheme("tokyonight")
	end,
}
