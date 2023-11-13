return {
	"kylechui/nvim-surround",
	event = { "BufReadPre", "BufNewFile" },
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	config = function()
		local status, surround = pcall(require, "nvim-surround")
		if not status then
			vim.notify(surround, vim.log.levels.ERROR)
			return
		end

		surround.setup({})
	end,
}
