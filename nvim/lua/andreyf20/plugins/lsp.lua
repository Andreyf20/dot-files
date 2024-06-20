-- LSP
return {
	"VonHeikemen/lsp-zero.nvim",
	event = "BufEnter",
	branch = "v3.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- Snippet completion plugins
		{ "hrsh7th/nvim-cmp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "L3MON4D3/LuaSnip" },
		-- Pictograms plugin
		{ "onsails/lspkind.nvim" },
		-- Snippets end
	},
	config = function()
		-- Old LSP.lua config
		local lsp_zero = require("lsp-zero")
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		-- Playing around with inlay hints
		local enable_inlay_hints = function(client, bufnr)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(true, { buffer = bufnr })
				vim.keymap.set("n", "<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(), { buffer = bufnr })
					print("Toggled inlay hints: " .. tostring(vim.lsp.inlay_hint.is_enabled()))
				end)
			end
		end

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
			handlers = {
				-- Setup LSPs automatically
				lsp_zero.default_setup,
				-- Setup LSPs manually
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								diagnostics = {
									-- Fix for global vim warning
									globals = { "vim" },
								},
								hint = {
									enable = true,
								},
							},
						},
						on_attach = lsp_zero.on_attach, -- enable_inlay_hints,
						capabilities = lsp_zero.capabilities,
					})
				end,
			},
		})

		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
			-- Custom Keybinds
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
		-- require("lspconfig").sourcekit.setup({
		-- 	on_attach = lsp_zero.on_attach,
		-- 	capabilities = {
		-- 		workspace = {
		-- 			didChangeWatchedFiles = {
		-- 				dynamicRegistration = true,
		-- 			},
		-- 		},
		-- 	},
		-- })

		-- Old CMP.lua config
		-- Currently using LuaSnip
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		local cmp_mappings = cmp.mapping.preset.insert({
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-c>"] = cmp.mapping.abort(),
			["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
			["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
			["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<C-u>"] = cmp.mapping.scroll_docs(-4),
			["<C-d>"] = cmp.mapping.scroll_docs(4),
		})

		cmp.setup({
			snippet = {
				-- REQUIRED - you must specify a snippet engine
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp_mappings,
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "path" },
				{ name = "buffer" },
			}),
			-- Enable pictogram icons for lsp/autocompletion
			formatting = {
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})

		-- Set configuration for specific filetype.
		cmp.setup.filetype("gitcommit", {
			sources = cmp.config.sources({
				{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
			}, {
				{ name = "buffer" },
			}),
		})

		-- LuaSnip config
		local ls = require("luasnip")
		local types = require("luasnip.util.types")

		ls.config.set_config({
			-- This tells LuaSnip to remember to keep around the last snippet.
			-- You can jump back into it even if you move outside of the selection
			history = true,

			-- This one is cool cause if you have dynamic snippets, it updates as you type!
			updateevents = "TextChanged,TextChangedI",

			-- Autosnippets:
			enable_autosnippets = false,

			ext_opts = {
				[types.choiceNode] = {
					active = {
						virt_text = { { " « ", "NonTest" } },
					},
				},
			},
		})

		-- <c-k> is my expansion key
		-- this will expand the current item or jump to the next item within the snippet.
		vim.keymap.set({ "i", "s" }, "<c-k>", function()
			if ls.expand_or_jumpable() then
				ls.expand_or_jump()
			end
		end, { silent = true })

		-- <c-j> is my jump backwards key.
		-- this always moves to the previous item within the snippet
		vim.keymap.set({ "i", "s" }, "<c-j>", function()
			if ls.jumpable(-1) then
				ls.jump(-1)
			end
		end, { silent = true })

		-- <c-l> is selecting within a list of options.
		-- This is useful for choice nodes (introduced in the forthcoming episode 2)
		vim.keymap.set("i", "<c-l>", function()
			if ls.choice_active() then
				ls.change_choice(1)
			end
		end)

		-- shorcut to source my luasnips file again, which will reload my snippets
		vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/lua/andreyf20/plugins/lsp.lua<CR>")

		local shared_snippets = {
			ls.parser.parse_snippet("lv", "console.log('${1}', ${2});\n${0}"),
			ls.parser.parse_snippet("dv", "<div>${1}</div>\n"),
		}

		ls.add_snippets("javascript", shared_snippets)
		ls.add_snippets("typescript", shared_snippets)
		ls.add_snippets("javascriptreact", shared_snippets)
		ls.add_snippets("typescriptreact", shared_snippets)
	end,
}
