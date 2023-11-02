return {
	-- mark files and easily move between them
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>a",
			"<cmd>lua require('harpoon.mark').add_file()<CR>",
			{ desc = "Mark file with harpoon" }
		)
		vim.keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<CR>",
			{ desc = "Go to next harpoon mark" }
		)
		vim.keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
			{ desc = "Go to previous harpoon mark" }
		)
		vim.keymap.set(
			"n",
			"<leader>he",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
			{ desc = "Show harpoon marks" }
		)
	end,
}
