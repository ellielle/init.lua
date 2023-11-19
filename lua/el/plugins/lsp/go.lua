return {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
	},
	config = function()
		local status, go = pcall(require, "go")
		if not status then
			vim.notify(go, vim.log.levels.ERROR)
			return
		end
	end,
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ":lua require('go.install').update_all_sync()",
}
