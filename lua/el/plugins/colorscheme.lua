return {
  "rose-pine/neovim",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  config = function()
    vim.cmd.colorscheme "rose-pine"
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#242a35" })
  end,
}
