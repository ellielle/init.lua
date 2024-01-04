return {
	"nvim-neorg/neorg",
	run = ":Neorg sync-parsers",
	config = function()
		local neorg_status, neorg = pcall(require, "neorg")
		if not neorg_status then
			vim.notify(neorg, vim.log.levels.ERROR)
			return
		end
		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		neorg.setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.integrations.treesitter"] = {},
				["core.integrations.nvim-cmp"] = {},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.autocommands"] = {},
				["core.highlights"] = {},
				["core.mode"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
							python = "~/notes/python",
							golang = "~/notes/golang",
							["data-alg"] = "~/notes/data-alg/",
							javascript = "~/notes/javascript",
						},
						default_workspace = "notes",
					},
				},
			},
		})
	end,
}
