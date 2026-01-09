return {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.1",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                ripgrep_arguments = {
                    "rg",
                    "--hidden",
                    "--no-heading",
                    "--with-filename",
                    "--line-number",
                    "--column",
                    "--smart-case",
                },
            },
        })

        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>vvr", builtin.lsp_references, {})
    end,
}
