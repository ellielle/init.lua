return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvimtmux_status, nvim_tmux_nav = pcall(require, "nvim-tmux-navigation")
		if not nvimtmux_status then
			vim.notify(nvim_tmux_nav, vim.log.levels.ERROR)
			return
		end

		vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
		vim.keymap.set("n", "<C-Esc>", nvim_tmux_nav.NvimTmuxNavigateNext)
	end,
}
