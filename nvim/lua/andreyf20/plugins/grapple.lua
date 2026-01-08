-- https://github.com/ThePrimeagen/harpoon/issues/577#issuecomment-3059003356
return {
    "cbochs/grapple.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true }
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    opts = {
        scope = "git", -- also try out "git_branch"
    },
    keys = {
        { "<leader>a", "<cmd>Grapple toggle<cr>",          desc = "Tag a file" },
        { "<leader>e", "<cmd>Grapple toggle_tags<cr>",     desc = "Toggle tags menu" },

        { "<c-h>",     "<cmd>Grapple select index=1<cr>",  desc = "Select first tag" },
        { "<c-j>",     "<cmd>Grapple select index=2<cr>",  desc = "Select second tag" },
        { "<c-k>",     "<cmd>Grapple select index=3<cr>",  desc = "Select third tag" },
        { "<c-l>",     "<cmd>Grapple select index=4<cr>",  desc = "Select fourth tag" },

        { "<c-s-h>",   "<cmd>Grapple cycle_tags prev<cr>", desc = "Go to previous tag" },
        { "<c-s-l>",   "<cmd>Grapple cycle_tags next<cr>", desc = "Go to next tag" },
    },
}
