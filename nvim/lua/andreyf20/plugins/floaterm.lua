-- Open lazygit in a floating window
return {
    "voldikss/vim-floaterm",
    event = "BufEnter",
    config = function()
        vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>:FloatermNew --width=0.99 --height=0.99 lazygit<CR>", {})
    end,
}
