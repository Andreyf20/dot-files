require("andreyf20")

-- Highlight yanked text
vim.cmd [[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup="IncSearch", timeout=100 })
  augroup END
]]

-- Could play around with this more to set a custom color but works for now
-- vim.api.nvim_set_hl(0, 'highlight_yank', { fg = "green", bg = "black" })
