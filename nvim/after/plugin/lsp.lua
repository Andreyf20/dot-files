local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
  'tsserver',
  'rust_analyzer',
  'eslint',
  'cssls',
  'pyright',
  'elixirls',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


-- Configure this in the cmp.lua file
-- Disabling tab in the lsp file not working no idea why so i'm keeping this here
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  -- This remap requires the plugin null-ls to be installed
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ff", "<cmd>lua vim.lsp.buf.format()<CR>", {})
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

-- Annoying elixirls config, also probably need another separate formatter for phoenix
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').elixirls.setup({
  cmd = { "/home/andrey/.elixirls/language_server.sh" },
  capabilities = capabilities,
  flags = {
    debounce_text_changes = 150,
  },
  elixirLS = {
    dialyzerEnabled = false,
    fetchDeps = false,
  };
})
