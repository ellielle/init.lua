vim.g.mapleader = " "

-- Tab control
vim.keymap.set("n", "<leader>tt", ":tabnew<CR>", { desc = "New Tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Next Tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Previous Tab" })
vim.keymap.set("n", "<leader>td", ":tabc<CR>", { desc = "Close Tab" })

-- Allows shifting highlighted text up and down in visual mode
-- fails when trying to move beyond first or last line in buffer
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- vim.keymap.set("n", "Y", "yg$")

-- Keep cursor in place when using 'J' to join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Half screen scrolling that keeps the cursor toward the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle when jumping between them
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pass highlighted word into _ register before pasting
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Delete to black hole before paste" })

-- Yanks into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "Yank to system" })

-- Delete into _ register
vim.keymap.set("n", "<leader>d", '"_d', { desc = "Delete to black hole" })
vim.keymap.set("v", "<leader>d", '"_d', { desc = "Delete to black hole" })

-- A hack around the differences between C-c vs Esc with vertical edit mode
vim.keymap.set("i", "<C-c>", "<Esc>")

-- pls go away Q
vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Shortcut to substitute all instances of the text the cursor is over
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Shortcut to make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
