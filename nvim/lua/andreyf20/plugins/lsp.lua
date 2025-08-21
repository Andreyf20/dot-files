return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Easy LSP installation
		{ "mason-org/mason.nvim" },
		{ "mason-org/mason-lspconfig.nvim" },
		-- Folke LuaLS config
		{
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					-- See the configuration section for more details
					-- Load luvit types when the `vim.uv` word is found
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
		-- Suggestion engine, nvim-cmp replacement
		{
			"saghen/blink.cmp",
			version = "1.*",
			-- Snippets
			dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

			opts = {
				-- This is already using my keybinds
				-- C-p previous
				-- C-n next
				-- C-y accept
				-- Added enter also as accept
				keymap = { preset = "default", ["<CR>"] = { "accept", "fallback" } },

				snippets = { preset = "luasnip" },

				appearance = {
					-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
					-- Adjusts spacing to ensure icons are aligned
					nerd_font_variant = "mono",
				},

				-- (Default) Only show the documentation popup when manually triggered
				-- Disable the auto selection of suggestions and auto insert when
				-- moving through the suggestion popup
				completion = {
					documentation = { auto_show = false },
					list = { selection = { preselect = false, auto_insert = false } },
					menu = {
						border = "rounded",
						draw = {
							gap = 2,
							columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
						},
					},
				},

				-- Default list of enabled providers defined so that you can extend it
				-- elsewhere in your config, without redefining it, due to `opts_extend`
				sources = {
					default = { "lsp", "path", "snippets", "buffer" },
				},

				-- If the rust fuzzy finder doesn't work use:
				-- implementation = "lua"
				fuzzy = { implementation = "prefer_rust_with_warning" },

				-- Shows a signature help window while you type arguments for a function
				signature = { enabled = true },
			},
			opts_extend = { "sources.default" },
		},
	},
	config = function()
		-- Easy LSP installation
		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				-- Javascript, Typescript
				-- "ts_ls",
				-- "cssls",
				-- Rust
				-- "rust_analyzer",
				-- Python
				-- "pyright",
				-- Golang
				-- "gopls",
				-- C#
				-- "csharp_ls",
			},
		})

		-- Some LSPs require manual enabling for some reason?
		-- local lspconfig = require("lspconfig")
		-- lspconfig.ts_ls.setup({}) -- Enable here or won't work for single files????

		-- No idea how this got disabled, but it enables back the inline err/war messages
		vim.diagnostic.enable = true
		vim.diagnostic.config({
			virtual_text = true,
		})

		-- Custom LSP Keybinds, probably should move to keybinds?
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
