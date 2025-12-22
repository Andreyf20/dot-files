vim.g.mapleader = " "
-- Nvimtree disables default Explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")
-- Save file and quit
vim.keymap.set("n", "<leader>qw", "<cmd>wq<CR>")
-- Quit without saving, change to qa! to force without warning
vim.keymap.set("n", "<leader>qa", "<cmd>qa<CR>")
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Do not care about case when searching
vim.keymap.set("n", "/", "/\\c")

-- Move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Replace word right under the cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
