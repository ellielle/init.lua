return {
	"tiagovla/tokyodark.nvim",
	lazy = false,
	opts = {},
	config = function(_, opts)
		local setup, colorscheme = pcall(require, "tokyodark")
		if not setup then
			vim.notify(colorscheme, vim.log.levels.ERROR)
			return
		end

		colorscheme.setup({})

		vim.cmd.colorscheme("tokyodark")
	end,
}
