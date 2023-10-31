local lsp_zero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		-- -- Javascript, Typescript
		-- "eslint",
		-- "tsserver",
		-- "cssls",
		-- -- Rust
		-- "rust_analyzer",
		-- -- Python
		-- "pyright",
		-- -- Golang
		-- "gopls",
		-- -- C#
		-- "csharp_ls",
	},
})
