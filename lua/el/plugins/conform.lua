return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local status, conform = pcall(require, "conform")
		if not status then
			vim.notify(conform, vim.log.levels.ERROR)
			return
		end

		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		wk.register({
			name = "conform",
			[";"] = {
				function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 500,
					})
				end,
				"Format file, or range in visual mode",
			},
		}, { prefix = "<leader>" })

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
		})
	end,
}
