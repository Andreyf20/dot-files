-- Setup vim config
require("andreyf20.remap")
require("andreyf20.set")

-- Install lazy plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup plugins
require("lazy").setup("andreyf20.plugins")

-- Highlight yanked text
vim.cmd([[
  augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank({ higroup="IncSearch", timeout=100 })
  augroup END
]])

-- Could play around with this more to set a custom color but works for now
-- vim.api.nvim_set_hl(0, 'highlight_yank', { fg = "green", bg = "black" })
