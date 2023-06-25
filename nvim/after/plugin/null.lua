local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.autopep8,
        null_ls.builtins.formatting.csharpier,
        null_ls.builtins.formatting.mix, -- Elixir
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

