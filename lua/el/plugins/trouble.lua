return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    {
      "<leader>tx",
      ":lua require('trouble').toggle()<CR>",
      desc = "trouble: Toggle",
    },
    {
      "<leader>tw",
      ":lua require('trouble').toggle('workspace_diagnostics')<CR>",
      desc = "trouble: Toggle workspace diagnostics",
    },
    {
      "<leader>tq",
      ":lua require('trouble').toggle('quickfix')<CR>",
      desc = "trouble: Toggle quickfix",
    },
    {
      "<leader>tl",
      ":lua require('trouble').toggle('loclist')<CR>",
      desc = "trouble: Toggle local list",
    },
    {
      "gR",
      ":lua require('trouble').toggle('lsp_references')<CR>",
      desc = "trouble: Toggle lsp references",
    },
  },
}
