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

		local builtin_status, builtin = pcall(require, "telescope.builtin")
		if not builtin_status then
			print("telescope.builtin failed to load")
			return
		end

		telescope.setup({
			defaults = {
				file_ignore_patterns = { "node_modules" },
				-- hidden, tail, absolute, smart, shorten, truncate (truncate can = a number like "truncate = 3")
				path_display = { "truncate" },
				preview = {
					-- disable treesitter in the preview window so large files don't hang
					treesitter = false,
					filesize_limit = 0.1,
					timeout = 250,
				},
			},
		})

		-- set keymaps
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy find files in cwd" })
		vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Fuzzy find files in current git repo" })
		-- find string in cwd
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("grep > ") })
		end, { desc = "Find any string in cwd" })

		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Fuzzy find help tags" })
	end,
}
