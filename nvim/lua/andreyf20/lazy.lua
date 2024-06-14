return require("lazy").setup({
	-- Fuzzy finder, make sure to install ripgrep fd
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Color themes
	-- use('folke/tokyonight.nvim')
	-- use('EdenEast/nightfox.nvim')
	{ "catppuccin/nvim", name = "catppuccin" },

	-- Syntax highlighting
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Show sticky buffer at the top
	"nvim-treesitter/nvim-treesitter-context",

	-- Blazingly fast file swap
	"ThePrimeagen/harpoon",

	-- List of changes to the current buffer
	"mbbill/undotree",

	-- Rainbow brackets
	"HiPhish/rainbow-delimiters.nvim",

	-- Show indent lines
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

	-- Auto pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- This is equalent to setup({}) function
	},

	-- Surround command
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end,
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Show preview of colors in the files
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		event = "BufEnter",
	},

	-- Comment code
	{
		"numToStr/Comment.nvim",
		event = "BufEnter",
		dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
		config = function()
			require("Comment").setup({
				pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
			})
		end,
	},
	-- Comment end

	-- File tree plugin + icons
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional icons
		},
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Snippet completion plugins
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			-- Pictograms plugin
			{ "onsails/lspkind.nvim" },
			-- Snippets end
		},
	},

	-- Formatter
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {},
	},

	-- Copilot replacement
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
		version = "1.8.37",
	},

	-- Git plugins
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
	},
	-- lazygit
	{
		"voldikss/vim-floaterm",
		event = "BufEnter",
	},
	-- Git plugins end
})
