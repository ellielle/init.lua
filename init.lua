-- load neovim settings
require("core.options")
local keymaps = require("core.keymaps")

keymaps.init() -- initialize and load general keymaps
keymaps.plugins_keymaps() -- load plugin-based keymaps

require("core.lazy") -- load lazy.nvim package manager
require("core.colorscheme") -- set colorscheme

-- fix errors not clearing in some cases with TS
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
