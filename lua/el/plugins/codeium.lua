return {
	"Exafunction/codeium.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local status, codeium = pcall(require, "codeium")
		if not status then
			vim.notify(codeium, vim.log.levels.ERROR)
			return
		end
		codeium.setup({})
	end,
}
