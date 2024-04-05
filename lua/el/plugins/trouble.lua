return {
  "folke/trouble.nvim",
  -- branch = "dev",
  keys = {
    {
      "<leader>xx",
      function()
        require("trouble").toggle()
      end,
      desc = "Toggle (Trouble)",
    },
    {
      "<leader>xw",
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      desc = "[W]orkspace Diagnostics (Trouble)",
    },
    {
      "<leader>xd",
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      desc = "Buffer Diagnostics (Trouble)",
    },
    {
      "<leader>xq",
      function()
        require("trouble").toggle "quickfix"
      end,
      desc = "[Q]uickfix (Trouble)",
    },
    {
      "<leader>xl",
      function()
        require("trouble").toggle "loclist"
      end,
      desc = "[L]oclist (Trouble)",
    },
  },
  opts = {}, -- for default options, refer to the configuration section for custom setup.
}
