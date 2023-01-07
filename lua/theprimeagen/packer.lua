-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
  use('nvim-treesitter/playground')
  use('nvim-treesitter/nvim-treesitter-textobjects')
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  --LSP
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  use(
      {
          "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
          config = function()
              require("lsp_lines").setup()
          end,
      }
  )

  use("folke/zen-mode.nvim")
  use("github/copilot.vim")
  -- Themes
  use("tanvirtin/monokai.nvim")
  use("EdenEast/nightfox.nvim")
  use("ellisonleao/gruvbox.nvim")
  use("jacoborus/tender.vim")
  use("sjl/badwolf")
  use("Mofiqul/vscode.nvim")
  --
  use("folke/neodev.nvim")
  use("wfxr/minimap.vim")

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional, for file icons
      },
      tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
  use("vim-airline/vim-airline")
  use("vim-airline/vim-airline-themes")
  use("ggandor/leap.nvim")
  use("tpope/vim-repeat")
  use("tpope/vim-eunuch")
  use("voldikss/vim-floaterm")
end)
