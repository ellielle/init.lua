vim.g.mapleader = " "

local init = function()
	-- Tab control
	vim.keymap.set("n", "<leader>tt", ":tabnew<CR>")
	vim.keymap.set("n", "<leader>tn", ":tabn<CR>")
	vim.keymap.set("n", "<leader>tp", ":tabp<CR>")
	vim.keymap.set("n", "<leader>td", ":tabc<CR>")

	-- Allows shifting highlighted text up and down in visual mode
	-- fails when trying to move beyond first or last line in buffer
	vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
	vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

	vim.keymap.set("n", "Y", "yg$")

	-- Keep cursor in place when using 'J' to join lines
	vim.keymap.set("n", "J", "mzJ`z")

	-- Half screen scrolling that keeps the cursor toward the center
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")

	-- Keep search terms in the middle when jumping between them
	vim.keymap.set("n", "n", "nzzzv")
	vim.keymap.set("n", "N", "Nzzzv")

	-- Pass highlighted word into _ register before pasting
	vim.keymap.set("x", "<leader>p", [[\"_dP]])

	-- Yanks into the system clipboard
	vim.keymap.set({ "n", "v" }, "<leader>y", [[\"+y]])
	vim.keymap.set("n", "<leader>Y", [[\"+Y]])

	-- Delete into _ register
	vim.keymap.set("n", "<leader>d", '"_d')
	vim.keymap.set("v", "<leader>d", '"_d')

	-- A hack around the differences between C-c vs Esc with vertical edit mode
	vim.keymap.set("i", "<C-c>", "<Esc>")

	-- pls go away Q
	vim.keymap.set("n", "Q", "<nop>")

	vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

	-- Formatting
	vim.keymap.set("n", "<leader>;f", vim.lsp.buf.format)
	vim.keymap.set("n", "<leader>;", "<cmd>lua require('conform').format()<CR>")
	-- Shortcut to substitute all instances of the text the cursor is over
	vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

	-- Shortcut to make file executable
	vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
end

local plugins_keymaps = function()
	-- nvim-tree
	vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>") -- Toggle nvimtree
	vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>") -- Toggle nvimtree

	-- undotree
	vim.keymap.set("n", "<leader>u", ":UndotreeShow<CR>") -- undotree toggle

	-- quickfix navigation
	vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
	vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
	vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
	vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

	-- fugitive
	vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

	-- telescope keymaps are in after/plugin/telescope.lua
end

-- LSP keymaps, only on when LSP is enabled
local lsp_keymaps = function(bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("n", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
end

-- return keymap modules
return {
	init = init,
	plugins_keymaps = plugins_keymaps,
	lsp_keymaps = lsp_keymaps,
}
