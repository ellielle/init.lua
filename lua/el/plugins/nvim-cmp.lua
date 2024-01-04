return {
	-- completion framework
	"hrsh7th/nvim-cmp",
	dependencies = {
		-- LSP completion source
		"hrsh7th/cmp-nvim-lsp",

		-- useful completion sources
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"hrsh7th/cmp-buffer",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local cmp_status, cmp = pcall(require, "cmp")
		if not cmp_status then
			vim.notify(cmp, vim.log.levels.ERROR)
			return
		end
		local luasnip_status, luasnip = pcall(require, "luasnip")
		if not luasnip_status then
			vim.notify(luasnip, vim.log.levels.ERROR)
			return
		end

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},

			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			mapping = cmp.mapping.preset.insert({
				-- Enter to confirm completions
				["<Tab>"] = cmp.mapping.confirm({ select = true }),

				-- move between completions
				["<C-j>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-k>"] = cmp.mapping.select_prev_item(cmp_select),

				-- ctrl+space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),
			}),

			-- autocompletion sources
			sources = cmp.config.sources({
				{ name = "path", priority = 250 }, -- file paths
				{ name = "nvim_lsp_signature_help" }, -- function signatures
				{ name = "nvim_lsp", priority = 1000, keyword_length = 3 }, -- lsp
				{ name = "nvim_lua", priority = 250, keyword_length = 2 }, -- completion for neovim's Lua runtime API
				{ name = "buffer", priority = 250, keyword_length = 2 }, -- source current buffer
				{ name = "LuaSnip", priority = 250, keyword_length = 2 },
				{ name = "neorg", priority = 250, keyword_length = 2 }, -- neorg plugin for notes/organization
			}),

			formatting = {
				fields = { "menu", "abbr", "kind" },
				format = function(entry, item)
					local menu_icon = {
						nvim_lsp = "λ",
						vsnip = "⋗",
						buffer = "Ω",
						path = "🖫",
					}
					item.menu = menu_icon[entry.source.name]
					return item
				end,
			},
		})
	end,
}
