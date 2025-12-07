-- Show preview of colors in the files
return {
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
    event = "BufEnter",
}
