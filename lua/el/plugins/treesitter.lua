return {
	-- highlighting for installed languages
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = function()
		local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
		ts_update()
	end,
	dependencies = {
		-- allow comments in mixed content files like jsx, html and svelte
		"JoosepAlviste/nvim-ts-context-commentstring",
		-- autoclose html tags
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import treesitter safely
		local status, treesitter = pcall(require, "nvim-treesitter.configs")
		if not status then
			vim.notify(treesitter, vim.log.levels.ERROR)
			return
		end

		-- configure treesitter
		treesitter.setup({
			-- enable context commentstring plugin
			context_commentstring = {
				enable = true,
				enable_autocmd = false,
			},
			-- ensure language parsers are installed
			ensure_installed = {
				"javascript",
				"typescript",
				"vue",
				"svelte",
				"tsx",
				"html",
				"css",
				"http",
				"json",
				"jsonc",
				"lua",
				"vim",
				"markdown",
				"query",
				"bash",
				"dockerfile",
				"gitignore",
			},
			sync_install = false,
			-- enable auto tag with ts-autotag
			autotag = { enable = true },
			-- auto-install language parsers
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			-- enable indentation
			indent = { enable = true },
		})

		-- disable query injections for languages that don't use it much
		-- improves performance on larger files
		-- https://www.reddit.com/r/neovim/comments/1144spy/will_treesitter_ever_be_stable_on_big_files/
		vim.treesitter.query.set("javascript", "injections", "")
		vim.treesitter.query.set("typescript", "injections", "")
		vim.treesitter.query.set("tsx", "injections", "")
		vim.treesitter.query.set("lua", "injections", "")
	end,
}
