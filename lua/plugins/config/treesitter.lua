-- import treesitter safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  print("nvim-treesitter failed to load")
  return
end

-- configure treesitter
treesitter.setup({
  -- enable context commentstring plugin
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- ensure language parsers are installed
  ensure_installed = {
    "lua",
    "vim",
    "vimdoc",
    "query",
    "html",
    "javascript",
    "typescript",
    "css",
    "vue",
    "svelte",
    "tsx",
    "json",
    "bash",
  },
  sync_install = false,

  -- enable auto tag with ts-autotag
  autotag = { enable = true },

  -- auto-install language parsers
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  -- enable indentation
  indent = { enable = true },
})

-- disable query injections for languages that don't use it much
-- improves performance on larger files
-- https://www.reddit.com/r/neovim/comments/1144spy/will_treesitter_ever_be_stable_on_big_files/
vim.treesitter.query.set("javascript", "injections", "")
vim.treesitter.query.set("typescript", "injections", "")
vim.treesitter.query.set("tsx", "injections", "")
vim.treesitter.query.set("lua", "injections", "")
