return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
		vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeFocus, { desc = "Focus undotree" })
	end,
}
