return {
	"rose-pine/neovim",
	lazy = false,
	priority = 1000,
	config = function()
		local setup, colorscheme = pcall(require, "rose-pine")
		if not setup then
			vim.notify(colorscheme, vim.log.levels.ERROR)
			return
		end

		colorscheme.setup({
			variant = "main",
			dark_variant = "main",
		})

		vim.cmd.colorscheme("rose-pine")

		-- set transparent background
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
