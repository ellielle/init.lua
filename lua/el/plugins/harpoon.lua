return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local wk = require "which-key"
    local harpoon = require "harpoon"

    harpoon:setup()

    wk.register {
      a = {
        function()
          harpoon:list():add()
        end,
        "Harpoon: [A]dd",
      },
      ["<C-e>"] = {
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        "Harpoon: Toggle menu",
      },
    }
  end,
}
