return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		-- import lualine plugin safely
		local status, lualine = pcall(require, "lualine")
		if not status then
			print("lualine failed to load")
			return
		end

		lualine.setup({
			options = {
				theme = "auto",
			},
		})
	end,
}
