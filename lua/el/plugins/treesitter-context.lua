return {
	"nvim-treesitter/nvim-treesitter-context",
	config = function()
		local context_status, context = pcall(require, "treesitter-context")
		if not context_status then
			vim.notify(context, vim.log.levels.ERROR)
			return
		end

		vim.keymap.set("n", "[c", function()
			context.go_to_context()
		end, { silent = true })
	end,
}
