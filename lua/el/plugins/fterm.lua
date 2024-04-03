return {
  "numToStr/FTerm.nvim",
  config = function()
    require("FTerm").setup {}

    -- Example keybindings
    vim.keymap.set("n", "<leader>ai", '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set("t", "<leader>ai", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
  end,
}
