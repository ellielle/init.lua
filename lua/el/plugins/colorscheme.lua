return {
	"Shatur/neovim-ayu",
	lazy = false,
	config = function()
		local setup, colorscheme = pcall(require, "ayu")
		if not setup then
			vim.notify(colorscheme, vim.log.levels.ERROR)
			return
		end

		colorscheme.setup({})

		vim.cmd.colorscheme("ayu")
	end,
}
