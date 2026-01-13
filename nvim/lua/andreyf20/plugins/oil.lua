return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    config = function()
        require "oil".setup({
            view_options = {
                show_hidden = true,
            },
        })
        vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

        -- Change the pwd to the one sent to neovim in the command,
        -- instead of the default from where it was executed
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                local buf = vim.api.nvim_get_current_buf()

                -- Case 1: started with a directory (Oil buffer)
                if vim.bo[buf].filetype == "oil" then
                    local dir = require("oil").get_current_dir()
                    if dir then
                        vim.cmd.cd(dir)
                    end
                    return
                end

                -- Case 2: started with a file
                local name = vim.api.nvim_buf_get_name(buf)
                if name ~= "" then
                    local dir = vim.fn.fnamemodify(name, ":p:h")
                    if vim.fn.isdirectory(dir) == 1 then
                        vim.cmd.cd(dir)
                    end
                end
            end,
        })
    end
}
