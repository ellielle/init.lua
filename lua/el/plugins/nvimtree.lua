return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local wk = require "which-key"
    local nvimtree = require "nvim-tree"
    wk.register {
      ["<C-n>"] = { ":NvimTreeToggle<CR>", "nvim-tree: Toggle" },
    }

    nvimtree.setup {
      sort = {
        sorter = "name",
      },
    }
  end,
}
