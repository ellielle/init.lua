return {
	"tpope/vim-fugitive",
	config = function()
		local wk_status, wk = pcall(require, "which-key")
		if not wk_status then
			vim.notify(wk, vim.log.levels.ERROR)
			return
		end

		wk.register({
			g = {
				s = { vim.cmd.Git, "Toggle git fugitive" },
			},
		}, { prefix = "<leader>" })
	end,
}
