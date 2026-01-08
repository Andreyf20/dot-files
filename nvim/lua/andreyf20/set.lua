--vim.opt.guicursor = ""
vim.opt.signcolumn = "yes"
vim.opt.winborder = "rounded"
--vim.opt.colorcolumn = "80"

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.cursorline = true

vim.opt.tabstop = 4        -- Equivalent number of spaces a <Tab> in the file counts for
vim.opt.softtabstop = 4    -- Spaces added when pressing <Tab>
vim.opt.shiftwidth = 4     -- Amount of spaces to use for indentation
vim.opt.expandtab = true   -- Insert spaces when <Tab> is pressed
vim.opt.smartindent = true -- Auto indent when starting a new line

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
