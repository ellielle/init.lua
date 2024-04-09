return {
  "Shatur/neovim-ayu",
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.cmd.colorscheme "ayu"
    vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#3e4b59" })
  end,
}
