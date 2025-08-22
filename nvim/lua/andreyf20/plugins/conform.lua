-- Code Formatter
return {
	"stevearc/conform.nvim",
	event = "BufEnter",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Typesript Javascript
				-- Use a sub-list to run only the first available formatter
				-- javascript = { "prettierd" },
				-- typescript = { "prettierd" },
				-- javascriptreact = { "prettierd" },
				-- typescriptreact = { "prettierd" },
				-- css = { "prettierd" },
				-- yaml = { "prettierd" },
				-- xml = { "prettierd" },
				-- Rust
				-- rust = { "rustfmt" },
				-- toml = { "taplo" },
				-- Python
				-- python = { "black" },
				-- Go
				-- go = { "gofumpt" },
				-- C#
				-- cs = { "csharpier" },
				-- Swift
				-- swift = { "swiftformat" },
			},
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.api.nvim_create_user_command("Format", function(args)
			local range = nil
			if args.count ~= -1 then
				local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
				range = {
					start = { args.line1, 0 },
					["end"] = { args.line2, end_line:len() },
				}
			end
			require("conform").format({ async = true, lsp_fallback = true, range = range })
		end, { range = true })

		vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Format<CR>", {})
	end,
}
