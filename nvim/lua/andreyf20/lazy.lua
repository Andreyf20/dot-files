return require('lazy').setup({
  -- Fuzzy finder, make sure to install ripgrep
  {
    'nvim-telescope/telescope.nvim',
    version = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- Nice color theme
  -- use('folke/tokyonight.nvim')
  -- use('EdenEast/nightfox.nvim')
  { "catppuccin/nvim",                 name = "catppuccin" },

  -- CLASSIC tree sitter
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

  -- Blazingly fast file swap
  'ThePrimeagen/harpoon',

  -- Get a tree of changes, similar to git integration in VSCode
  'mbbill/undotree',

  -- Copilot LOL
  {
    "zbirenbaum/copilot.lua",
    -- Lazy load
    cmd = "Copilot",
    event = "InsertEnter",
  },

  -- Show sticky buffer with the name of the indented block
  'nvim-treesitter/nvim-treesitter-context',

  -- no longer maintained, maybe remove?
  -- Rainbow brackets
  'p00f/nvim-ts-rainbow',

  -- Format files
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },

  -- Show indent lines
  { 'lukas-reineke/indent-blankline.nvim', version = "2.20.7" },

  -- Show preview of colors in the files
  'norcalli/nvim-colorizer.lua',

  -- Snippet completion plugins
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  -- Snippets end

  -- Comment code
  'numToStr/Comment.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- Comment end

  -- File tree plugin + icons
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional icons
    },
  },

  -- LSP
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }
  },
})
