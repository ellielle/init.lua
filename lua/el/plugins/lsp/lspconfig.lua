return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Alternative to typescript server (requires plenary)
		"pmizio/typescript-tools.nvim",
	},
	config = function()
		local lspconfig_status, lspconfig = pcall(require, "lspconfig")
		if not lspconfig_status then
			vim.notify(lspconfig, vim.log.levels.ERROR)
			return
		end

		local util_status, util = pcall(require, "lspconfig/util")
		if not util_status then
			vim.notify(util, vim.log.levels.ERROR)
			return
		end

		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
		if not cmp_nvim_lsp_status then
			vim.notify(cmp_nvim_lsp, vim.log.levels.ERROR)
			return
		end

		local typescript_tools_status, typescript_tools = pcall(require, "typescript-tools")
		if not typescript_tools_status then
			vim.notify(typescript_tools, vim.log.levels.ERROR)
			return
		end

		local keymaps = function(bufnr)
			wk.register({
				v = {
					c = {
						a = { vim.lsp.buf.code_action, "LSP: Code Actions", buffer = bufnr },
					},
					d = { vim.diagnostic.open_float, "LSP: Open float diagnostic", buffer = bufnr },
					r = {
						n = { vim.lsp.buf.rename, "LSP: Rename under cursor", buffer = bufnr },
						r = { vim.lsp.buf.references, "LSP: References", buffer = bufnr },
					},
					w = {
						s = { vim.lsp.buf.workspace_symbol, "LSP: Workspace Symbol", buffer = bufnr },
					},
				},
			}, { prefix = "<leader>" })

			wk.register({
				["[d"] = {
					function()
						vim.diagnostic.goto_next()
					end,
					"LSP Diagnostic: Goto Next",
					buffer = bufnr,
				},
				["]d"] = {
					function()
						vim.diagnostic.goto_prev()
					end,
					"LSP Diagnostic: Goto Prev",
					buffer = bufnr,
				},
				g = {
					d = { vim.lsp.buf.definition, "LSP: Goto definition", buffer = bufnr },
				},
				K = {
					function()
						vim.lsp.buf.hover()
					end,
					"LSP: Hover",
					buffer = bufnr,
				},
				["<C-i>"] = {
					function()
						vim.lsp.buf.signature_help()
					end,
					"LSP: Show information",
				},
			})
		end

		-- enable keybinds only when lsp server is available
		local on_attach = function(client, bufnr)
			-- assign keymaps meant for lsp features
			keymaps(bufnr)
		end

		local on_attach_ruff = function(client, bufnr)
			client.server_capabilities.hoverProvider = false
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure typescript server with plugin
		typescript_tools.setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				-- spawn additional tsserver instance to calculate diagnostics on it
				separate_diagnostic_server = false,
				expose_as_code_action = "all",
			},
		})

		-- Set up LSP servers with the same config
		local servers = { "html", "bashls", "jsonls", "tailwindcss", "cssls", "tailwindcss", "pyright" }

		for _, lsp in pairs(servers) do
			lspconfig[lsp].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
				},
			})
		end

		-- python config with ruff_lsp
		lspconfig["ruff_lsp"].setup({
			capabilities = capabilities,
			on_attach = on_attach_ruff,
		})

		-- go config with gopls
		lspconfig["gopls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "gopls" },
			filetypes = { "go", "gomod", "gowork", "gotmpl" },
			root_dir = util.root_pattern("go.work", "go.mod", ".git"),
			settings = {
				gopls = {
					completeUnimported = true,
					usePlaceholders = true,
					analyses = {
						unusedparams = true,
					},
				},
			},
		})

		-- configure svelte server
		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
						end
					end,
				})
			end,
		})

		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = {
				Lua = {
					-- make language server recognize 'vim' global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
			root_dir = function()
				return vim.loop.cwd()
			end,
		})
	end,
}
