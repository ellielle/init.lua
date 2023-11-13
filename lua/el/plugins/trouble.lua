return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	keys = {
		{
			"<leader>tx",
			"<cmd>lua require('trouble').toggle()<CR>",
			desc = "trouble: Toggle",
		},
		{
			"<leader>tw",
			"<cmd>lua require('trouble').toggle('workspace_diagnostics)<CR>",
			desc = "trouble: Toggle workspace diagnostics",
		},
		{
			"<leader>td",
			"<cmd>lua require('trouble').toggle('document_diagnostics)<CR>",
			desc = "trouble: Toggle document diagnostics",
		},
		{
			"<leader>tq",
			"<cmd>lua require('trouble').toggle('quickfix')<CR>",
			desc = "trouble: Toggle quickfix",
		},
		{
			"<leader>tl",
			"<cmd>lua require('trouble').toggle('loclist')<CR>",
			desc = "trouble: Toggle local list",
		},
		{
			"gR",
			"<cmd>lua require('trouble').toggle('lsp_references')<CR>",
			desc = "trouble: Toggle lsp references",
		},
	},
}
