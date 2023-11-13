return {
	"mrjones2014/legendary.nvim",
	priority = 10000,
	lazy = false,
	keys = {
		"<leader>lf",
		":Legendary<CR>",
		desc = "legendary: Toggle",
	},
	config = function()
		local status, legendary = pcall(require, "legendary")
		if not status then
			vim.notify(legendary, vim.log.levels.ERROR)
			return
		end

		legendary.setup({ extensions = { lazy_nvim = { auto_register = true } } })
	end,
}
