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
			print("nvim-tree failed to load")
			return
		end
		nvimtree.setup({
			sort = {
				sorter = "name",
			},
		})
		vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- Toggle nvimtree
		vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>") -- Toggle nvimtree
	end,
}
