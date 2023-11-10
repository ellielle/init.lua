return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local status, trouble = pcall(require, "trouble")
		if not status then
			vim.notify(trouble, vim.log.levels.ERROR)
		end

		vim.keymap.set("n", "<leader>tx", function()
			require("trouble").toggle()
		end)
		vim.keymap.set("n", "<leader>tw", function()
			require("trouble").toggle("workspace_diagnostics")
		end)
		vim.keymap.set("n", "<leader>td", function()
			require("trouble").toggle("document_diagnostics")
		end)
		vim.keymap.set("n", "<leader>tq", function()
			require("trouble").toggle("quickfix")
		end)
		vim.keymap.set("n", "<leader>tl", function()
			require("trouble").toggle("loclist")
		end)
		vim.keymap.set("n", "gR", function()
			require("trouble").toggle("lsp_references")
		end)
	end,
}
