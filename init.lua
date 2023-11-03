-- load neovim settings
require("el.core.options")
require("el.core.keymaps")
require("el.lazy") -- load lazy.nvim package manager

-- fix errors not clearing in some cases with TS
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
