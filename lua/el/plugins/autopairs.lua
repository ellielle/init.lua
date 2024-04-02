return {
  "windwp/nvim-autopairs",
  event = { "InsertEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local autopairs = require "nvim-autopairs"
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"

    autopairs.setup {
      check_ts = true,
      ts_config = {
        lua = { "string" }, -- don't add pairs in lua string treesitter nodes
        javascript = { "template_string" }, -- don't add pairs in javascript template string treesitter nodes
      },
    }

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
