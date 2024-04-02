return {
  "tpope/vim-fugitive",
  config = function()
    wk = require "which-key"

    wk.register({
      g = {
        s = { vim.cmd.Git, "Toggle git fugitive" },
      },
    }, { prefix = "<leader>" })
  end,
}
