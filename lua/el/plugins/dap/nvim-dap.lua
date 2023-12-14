return {
  "mfussenegger/nvim-dap",
  config = function()
    local wk_status, wk = pcall(require, "which-key")
    if not wk_status then
      vim.notify(wk, vim.log.levels.ERROR)
      return
    end

    wk.register({
      d = {
        b = { ":DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
        c = {
          function()
            require("dap").terminate()
            require("dapui").close()
          end,
          "DAP: Close",
        },
        h = { ":DapStepOut<CR>", "DAP: Step Out" },
        j = { ":DapStepOver<CR>", "DAP: Step Over" },
        l = { ":DapStepInto<CR>", "DAP: Step Into" },
        r = {
          p = {
            function()
              require("dap-python").test_method()
            end,
            "Run Python Debugger",
          },
        },
        x = {
          function()
            require("dap").restart()
          end,
          "DAP: Restart",
        },
      },
    }, { prefix = "<leader>" })
  end,
}
