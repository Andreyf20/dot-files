--vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
--vim.opt.colorcolumn = "80"

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true

vim.opt.tabstop = 2
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- If true set this remap to stop highlighting vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
