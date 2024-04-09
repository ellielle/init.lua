return {
  "NvChad/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup {
      filetypes = {
        css = { rgb_fn = true },
        "javascript",
        "typescript",
        html = { mode = "foreground" },
      },
    }
  end,
}
