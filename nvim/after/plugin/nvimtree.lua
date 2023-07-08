-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

local api = require('nvim-tree.api')
-- OR setup with some options
require("nvim-tree").setup({
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  sort_by = "case_sensitive",
  view = {
    width = 70,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  git = {
    enable = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  on_attach = function(bufnr)
    api.config.mappings.default_on_attach(bufnr)

    -- Remove keybindings
    vim.keymap.set('n', '<C-e>', '', { buffer = bufnr })
  end,
})

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>")
