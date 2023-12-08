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

		-- set transparent background
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
