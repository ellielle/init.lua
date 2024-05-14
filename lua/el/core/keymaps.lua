vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  Directions mimic vim movement
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })

-- Keybinds for resizing splits
vim.keymap.set("n", "<M-h>", "<C-w>5>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-l>", "<C-w>5<", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-k>", "<C-w>+", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<M-j>", "<C-w>-", { desc = "Move focus to the left window" })

-- TODO: bind keys when needed
-- Helper functions to test lua and reload pugins for dev
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Allows shifting highlighted text up and down in visual mode
-- fails when trying to move beyond first or last line in buffer
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place when using 'J' to join lines
vim.keymap.set("n", "J", "mzJ`z")

-- Half screen scrolling that keeps the cursor t oward the center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Keep search terms in the middle when jumping between them
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Pass highlighted word into _ register before
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "[_]register [d]elete before [P]utting" })

-- Yanks into the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "[+][Y]ank to system" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "[+][Y]ank to system" })

-- Delete into _ register
vim.keymap.set("n", "<leader>dd", '"_d', { desc = "[D]elete to black hole" })
vim.keymap.set("v", "<leader>dd", '"_d', { desc = "[D]elete to black hole" })

-- A hack around the differences between C-c vs Esc with LSP completion
-- TODO: remove when I get out of the bad habit of hitting this
vim.keymap.set("i", "<C-c>", "<cmd>echo 'USE CTRL+['<CR>")

-- pls go away Q, I don't use U
vim.keymap.set("n", "Q", "<nop>")

-- TODO: uncomment after rewrite
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Shortcut to substitute all instances of the text the cursor is over
vim.keymap.set("n", "<leader>g", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Shortcut to make file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Runs a shell command and pipes the output through jq to a new vertical buffer
-- Used for running curl commands from file to get API output in neovim
-- TODO: expand on this, create a temporary .sh filetype buffer
-- to write curl queries in, then this command below (but altered to open a vert split down) to open in a split beneath
vim.keymap.set(
  "n",
  "<leader>cs",
  ":vnew ++ff=unix | set filetype=sh | read !sh # | jq<cr>",
  { desc = "[C]url [S]hell file" }
)
