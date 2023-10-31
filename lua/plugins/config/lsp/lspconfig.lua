-- import lspconfig safely
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  print("lspconfig failed to load")
  return
end

-- import cmp_nvim_lsp safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  print("cmp_nvim_lsp failed to load")
  return
end

-- import typescript-tools safely
local typescript_tools_status, typescript_tools = pcall(require, "typescript-tools")
if not typescript_tools_status then
  print("typescript-tools failed to load")
  return
end

-- get a reference to keymaps
local keymaps = require("core.keymaps")

-- enable keybinds only for when lsp server available
local on_attach = function(client, bufnr)
  -- assign keymaps meant for lsp features
  keymaps.lsp_keymaps(bufnr)
end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure typescript server with plugin
typescript_tools.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = false,
  },
})

-- Set up LSP servers with the same config
local servers = { "html", "bashls", "jsonls", "tailwindcss", "cssls", "svelte", "tailwindcss" }

for _, lsp in pairs(servers) do
  require("lspconfig")[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      -- make language server recognize 'vim' global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
  root_dir = function()
    return vim.loop.cwd()
  end,
})
