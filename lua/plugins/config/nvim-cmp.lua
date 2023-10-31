local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  print("nvim-cmp failed to load")
  return
end

-- import luasnip plugin safely
local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
  print("luasnip did not load")
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    -- Enter to confirm completions
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    -- move between completions
    ["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-Tab>"] = cmp.mapping.select_prev_item(cmp_select),

    -- ctrl+space to trigger completion menu
    ["<C-Space>"] = cmp.mapping.complete(),
  }),

  -- autocompletion sources
  sources = cmp.config.sources({
    { name = "nvim_lsp_signature_help" },                 -- function param help
    { name = "nvim_lsp",               priority = 1000 }, -- lsp
    { name = "path",                   priority = 250 },
  })
})
