return {
	-- "folke/whick-key.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		config = function()
			require("plugins.config.telescope")
		end,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	},

	-- plugins
	{
		-- highlighting for installed languages
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
		config = function()
			require("plugins.config.treesitter")
		end,
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring", -- allow comments in mixed content files like jsx, html and svelte
			"windwp/nvim-ts-autotag", -- autoclose html tags
		},
	},

	{
		-- oopsie tree
		"mbbill/undotree",
		keys = {
			{ "<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle undotree" },
			{ "<leader>fu", vim.cmd.UndotreeFocus, desc = "Focus undotree" },
		},
	},

	{
		-- mark files and easily move between them
		"ThePrimeagen/harpoon",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = true,
		keys = {
			{ "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<cr>", desc = "Mark file with harpoon" },
			{
				"<leader>hn",
				"<cmd>lua require('harpoon.ui').nav_next()<cr>",
				desc = "Go to next harpoon mark",
			},
			{
				"<leader>hp",
				"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
				desc = "Go to previous harpoon mark",
			},
			{ "<leader>he", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "Show harpoon marks" },
		},
	},

	{
		-- git fun in vim
		"tpope/vim-fugitive",
	},

	-- configure LSP servers
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp.lspconfig")
		end,
		dependencies = {
			"pmizio/typescript-tools.nvim", -- Alternative to typescript server (requires plenary)
		},
	},

	-- manages and installs lsp servers/linters/formatters
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.config.lsp.mason")
		end,
		dependencies = {
			"williamboman/mason-lspconfig.nvim", -- bridges gap between mason & lspconfig
			"WhoIsSethDaniel/mason-tool-installer.nvim", -- sets up automatic installs for Mason
		},
	},

	-- formatting & linting
	{
		"stevearc/conform.nvim",
		config = function()
			require("plugins.config.conform")
		end,
	},

	-- autocompletion and snippets
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.config.nvim-cmp")
		end,
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip", -- for autocompletion
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lsp-signature-help", -- function parameter hints
		},
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.config.lualine")
		end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},

	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
	},

	{

		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
			vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			vim.keymap.set("n", "<C-Esc>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	},
}
