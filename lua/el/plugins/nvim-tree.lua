return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree_status, nvimtree = pcall(require, "nvim-tree")
		if not nvimtree_status then
			vim.notify(nvimtree, vim.log.levels.ERROR)
			return
		end
		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		wk.register({
			f = {
				e = { ":NvimTreeToggle<CR>", "nvim-tree: Toggle" },
			},
		}, { prefix = "<leader>" })

		nvimtree.setup({
			sort = {
				sorter = "name",
			},
		})
	end,
}
