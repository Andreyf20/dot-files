function ColorTerminal(color)
	-- color = color or "tokyonight-night"
	-- color = color or "duskfox"
	color = color or "catppuccin-mocha"
	vim.cmd.colorscheme(color)

	-- Set transparent background, disable this if not necessary
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

	-- No idea what this one does but it does not seem to affect the result
	-- vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })

	-- Transaprent background for nvim-tree
	-- vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NvimTreeNormalFloat", { bg = "none" })

	-- Set number line colors
	-- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
	-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#51B3EC", bold = true })
	-- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#51b3ec", bold = true })
	-- CursorLineNr needs to enable cursorline in set.lua
	-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#51b3af" })
end

ColorTerminal()
