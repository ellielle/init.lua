return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local none_status, nonels = pcall(require, "null-ls")
    if not none_status then
      vim.notify(nonels, vim.log.levels.ERROR)
      return
    end

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    nonels.setup({
      sources = {
        nonels.builtins.formatting.stylua,
        nonels.builtins.formatting.prettierd,
        nonels.builtins.formatting.gofmt,
        nonels.builtins.formatting.goimports_reviser,
        nonels.builtins.formatting.black,
        nonels.builtins.diagnostics.mypy,
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    })
  end,
}
