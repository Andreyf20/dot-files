return {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
        vim.o.background = "dark" -- Dark mode
        vim.cmd.colorscheme("rose-pine-moon")

        -- Set transparent background, disable this if not necessary
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })

        -- For floating windows, looks kinda bad recently no idea what changed
        -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        -- Set number line colors
        vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#51B3EC", bold = true })
        vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#51b3ec", bold = true })

        -- Change the color of the visual mode highlight
        vim.api.nvim_set_hl(0, "Visual", {
            bg = "#3d59a1",
            fg = "#000000",
            bold = true,
            ctermbg = 4,  -- Terminal blue (4)
            ctermfg = 15, -- Terminal white (15)
        })

        -- Highlight selection when yanking
        vim.api.nvim_set_hl(0, "YankHighlight", {
            bg = "#FFA500",
            fg = "#000000",
            bold = true,
        })

        vim.api.nvim_create_augroup("YankHighlight", { clear = true })
        vim.api.nvim_create_autocmd("TextYankPost", {
            group = "YankHighlight",
            callback = function()
                vim.highlight.on_yank({
                    higroup = "YankHighlight", -- Use custom group
                    timeout = 150,
                    on_visual = true,
                })
            end,
        })
    end,
}
