function colorTerminal(color)
  -- color = color or "tokyonight-night"
  color = color or "carbonfox"
  vim.cmd.colorscheme(color)

  -- Set transparent background, disable this if not necessary
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --
  -- Set number line colors, CursorLineNr needs to enable cursorline in set.lua
  -- vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"})
  vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = "green"})
end

colorTerminal()
