-- colorscheme setup
local setup, colorscheme = pcall(require, "rose-pine")
if not setup then
  print("The colorscheme failed to load")
  return
end

colorscheme.setup({
  variant = "main",
  dark_variant = "main",
})

vim.cmd.colorscheme("rose-pine")

-- set transparent background
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
