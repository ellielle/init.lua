return {
	"rebelot/kanagawa.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local setup, colorscheme = pcall(require, "kanagawa")
		if not setup then
			vim.notify(colorscheme, vim.log.levels.ERROR)
			return
		end

		colorscheme.setup({
			theme = "wave",
			-- remove gutter background
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
						},
					},
				},
			},
		})

		vim.cmd.colorscheme("kanagawa")
	end,
}
