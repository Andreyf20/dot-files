local null_ls = require("null-ls")
local mason_null = require("mason-null-ls")

mason_null.setup({
  ensure_installed = {
    -- Javascript, Typescript
    'eslint_d',
    'prettierd',
    -- Golang
    'goimports-reviser',
    'gofumpt',
    'golines',
    -- C#
    'csharpier',
  }
})

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  sources = {
    -- Rust
    null_ls.builtins.formatting.rustfmt,
    -- Python
    null_ls.builtins.formatting.autopep8,
  },

  -- Might wanna remove the auto format on save if it starts giving me errors
  -- no idea what it does when there is no formatter for the file
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- This requires nvim 0.9>
          vim.lsp.buf.format({ async = false })
        end,
      })
    end
  end,
})
