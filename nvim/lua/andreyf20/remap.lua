vim.g.mapleader = " "

vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")

-- Do not care about case when searching
vim.keymap.set("n", "/", "/\\c")

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move line below to the end of the current line
vim.keymap.set("n", "J", "mzJ`z")

-- Center screen when jumping around withe <C-d> and <C-u>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Copy to the system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")
