-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Fuzzy finder, make sure to install ripgrep
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- CLASSIC tree sitter
  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

  -- Nice color theme
  use('folke/tokyonight.nvim')
  use('EdenEast/nightfox.nvim')

  -- Blazingly fast file swap
  use('ThePrimeagen/harpoon')

  -- Get a tree of changes, similar to git integration in VSCode
  use('mbbill/undotree')

  -- i dont even know what this does
  use('tpope/vim-fugitive')

  -- Copilot LOL
  use('github/copilot.vim')

  -- Show sticky buffer with the name of the indented block
  -- use('wellle/context.vim') kinda bugged dont want to deal with it rn

  -- no longer maintained, maybe remove?
  -- Rainbow brackets
  use('p00f/nvim-ts-rainbow')

  -- Format files
  use('jose-elias-alvarez/null-ls.nvim')

  -- Show indent lines
  use('lukas-reineke/indent-blankline.nvim')

  -- Show preview of colors in the files
  use('norcalli/nvim-colorizer.lua')

  -- Snippet completion plugins
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-nvim-lsp')
  use('saadparwaiz1/cmp_luasnip') -- Testing this might need to change it, actual snippets
  -- Snippets end

  -- Comment code
  use('numToStr/Comment.nvim')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  -- Comment end

  -- File tree plugin + icons
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
    }

  }
end)
