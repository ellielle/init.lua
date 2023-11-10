-- disable netrw first thing for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_newtwPlugin = 1
vim.opt.termguicolors = true
-- vim.opt.colorcolumn = "120" -- column for line length, kinda annoying af

vim.opt.tabstop = 2 -- tabbed lines will appear indented by this many characters
-- vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2 -- number of spaces inserted for each tab/indent
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.opt.wrap = false

vim.opt.nu = true -- turn on line numbers
vim.opt.relativenumber = true -- relative line numbers

vim.opt.splitbelow = true -- new windows are created above
vim.opt.splitright = true -- new windows are created to the left

vim.opt.scrolloff = 8 -- minimum visible lines above/below
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@_@")

vim.opt.ignorecase = true
vim.opt.smartcase = true -- ignore case if only lower case is used (only used when ignorecase is on)
vim.opt.breakindent = true -- wrapped lines continue with the same indent
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false -- highlight all matches on previous search pattern
vim.opt.incsearch = true -- incremental search highlighting

-- :help completeopt
-- menuone: popup even when there's only one match
-- noinsert: Do not insert text until a selection is made
-- noselect: Do not select, force to select one from the menu
-- shortness: avoid showing extra messages when using completion
-- updatetime: set updatetime for CursorHoldk
vim.opt.completeopt = { "menuone", "noselect", "noinsert" } -- use the same menu when one or more options available
vim.opt.updatetime = 50
