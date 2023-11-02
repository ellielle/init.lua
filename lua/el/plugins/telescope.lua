return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
	config = function()
		-- import telescope safely
		local status, telescope = pcall(require, "telescope")
		if not status then
			print("telescope failed to load")
			return
		end

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
				-- hidden, tail, absolute, smart, shorten, truncate (truncate can = a number like "truncate = 3")
				path_display = { "truncate" },
				preview = {
					-- Disable treesitter in the preview window so large files don't hang
					treesitter = false,
					filesize_limit = 0.1,
					timeout = 250,
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<C-p>", "<cmd>Telescope git_files<CR>", { desc = "Fuzzy find files in current git repo" })
		-- Find string in cwd
		vim.keymap.set("n", "<leader>fs", function()
			telescope.grep_string({ search = vim.fn.input("grep > ") })
		end)
	end,
}
