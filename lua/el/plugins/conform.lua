return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- import conform formatter plugin safely
		local status, conform = pcall(require, "conform")
		if not status then
			print("conform did not load")
			return
		end

		-- setup conform plugin
		conform.setup({
			formatters_by_ft = {
				-- lua
				lua = { "stylua" },
				-- base web formats
				javascript = { "prettierd" },
				typescript = { "prettierd" },
				javascriptreact = { "prettierd" },
				typescriptreact = { "prettierd" },
				html = { "prettierd" },
				css = { "prettierd" },
				json = { "prettierd" },
				vue = { "prettierd" },
				-- prettierd is having issues with svelte files, default to lsp_fallback
				-- svelte = { "prettierd" },
				-- everything else will use lsp format
			},
			-- enable format on save
			format_on_save = {
				-- These options will be passed to conform.format()
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},

			vim.keymap.set({ "n", "v" }, "<leader>;", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file, or range in visual mode" }),

			-- Formatting
			-- vim.keymap.set("n", "<leader>f;", vim.lsp.buf.format), -- default formatter for svelte files, issues with prettierd
		})
	end,
}
