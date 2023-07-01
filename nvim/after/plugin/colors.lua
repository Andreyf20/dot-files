function colorTerminal(color)
  -- color = color or "tokyonight-night"
  color = color or "carbonfox"
  vim.cmd.colorscheme(color)

  -- Set transparent background, disable this if not necessary
  -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

colorTerminal()
