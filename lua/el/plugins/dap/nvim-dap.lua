return {
  "mfussenegger/nvim-dap",
  config = function()
    local wk_status, wk = pcall(require, "which-key")
    if not wk_status then
      vim.notify(wk, vim.log.levels.ERROR)
      return
    end

    wk.register({
      p = {
        b = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
        p = {
          r = {
            function()
              require("dap-python").test_method()
            end,
            "Run Python Debugger",
          },
        },
      },
    }, { prefix = "<leader>" })
  end,
}
