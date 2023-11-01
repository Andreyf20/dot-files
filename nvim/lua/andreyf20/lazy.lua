return require("lazy").setup({
	-- Fuzzy finder, make sure to install ripgrep
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- Nice color theme
	-- use('folke/tokyonight.nvim')
	-- use('EdenEast/nightfox.nvim')
	{ "catppuccin/nvim", name = "catppuccin" },

	-- CLASSIC tree sitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Show sticky buffer with the name of the indented block
	"nvim-treesitter/nvim-treesitter-context",

	-- Blazingly fast file swap
	"ThePrimeagen/harpoon",

	-- Get a tree of changes, similar to git integration in VSCode
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
			require("nvim-surround").setup({
				-- Leave empty to use defaults
			})
		end,
	},

	-- Status Line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Show preview of colors in the files
	"norcalli/nvim-colorizer.lua",

	-- Snippet completion plugins
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-nvim-lsp",
	"saadparwaiz1/cmp_luasnip",
	-- Pictograms plugin
	"onsails/lspkind.nvim",
	-- Snippets end

	-- Comment code
	"numToStr/Comment.nvim",
	"JoosepAlviste/nvim-ts-context-commentstring",
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

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
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
	},

	-- Git plugins
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
	},
})
