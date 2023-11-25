return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>fe", ":NvimTreeToggle<CR>", desc = "nvim-tree: Toggle" },
	},
	config = function()
		local nvimtree_status, nvimtree = pcall(require, "nvim-tree")
		if not nvimtree_status then
			vim.notify(nvimtree, vim.log.levels.ERROR)
			return
		end
		nvimtree.setup({
			sort = {
				sorter = "name",
			},
		})
	end,
}
