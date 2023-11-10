return {
	"simrat39/rust-tools.nvim",
	config = function()
		local status, rusttools = pcall(require, "rust-tools")
		if not status then
			vim.notify(rusttools, vim.log.levels.ERROR)
			return
		end

		rusttools.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "K", rusttools.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set(
						"n",
						"<leader>vca",
						rusttools.code_action_group.code_action_group,
						{ buffer = bufnr }
					)
				end,
			},
		})
	end,
}
