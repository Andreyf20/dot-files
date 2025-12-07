-- File tree plugin + icons
return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons", -- optional icons
    },
    config = function()
        -- Disable netrw
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- Set termguicolors to enable highlight groups
        vim.opt.termguicolors = true

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
        })

        vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", { silent = true })
    end,
}
