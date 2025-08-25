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
require("lazy").setup({
	spec = "andreyf20.plugins",
	change_detection = {
		notify = false, -- Disable annoying message when updating config
	},
})
