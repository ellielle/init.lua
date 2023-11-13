return {
	-- mark files and easily move between them
	"ThePrimeagen/harpoon",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>a",
			"<cmd>lua require('harpoon.mark').add_file()<CR>",
			desc = "harpon: Mark file",
		},
		{
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<CR>",
			desc = "harpoon: Go to next mark",
		},
		{
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<CR>",
			desc = "harpoon: Go to previous mark",
		},
		{
			"<leader>he",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>",
			desc = "harpoon: Show marks",
		},
	},
}
