local lsp_zero = require("lsp-zero")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({})
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
	-- Setup LSPs automatically
	handlers = {
		lsp_zero.default_setup,
	},
})

lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	-- Keybinds
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.rsp.buf.references()
	end)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end)
end)

-- Setup for swift source kit lsp
-- local lspconfig = require("lspconfig")
--
-- lspconfig.sourcekit.setup({
-- 	capabilities = {
-- 		workspace = {
-- 			didChangeWatchedFiles = {
-- 				dynamicRegistration = true,
-- 			},
-- 		},
-- 	},
-- })
