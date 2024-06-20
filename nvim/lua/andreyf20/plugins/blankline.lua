-- Show indent lines
return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	config = function()
		require("ibl").setup({
			scope = {
				enabled = true,
				show_start = false,
				-- highlight = hl_name_list
			},
		})
	end,
}
