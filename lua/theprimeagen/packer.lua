-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
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
                { 'neovim/nvim-lspconfig' },
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'hrsh7th/cmp-nvim-lua' },

                -- Snippets
                { 'L3MON4D3/LuaSnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }
        use("mfussenegger/nvim-dap")
        use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
        use {
            "SmiteshP/nvim-navic",
            requires = "neovim/nvim-lspconfig"
        }
        use(
            {
                "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                config = function()
                    require("lsp_lines").setup()
                end,
            }
        )
        use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")

        use {
            'saecki/crates.nvim',
            tag = 'v0.3.0',
            requires = { 'nvim-lua/plenary.nvim' },
            config = function()
                require('crates').setup()
            end,
        }
        use("folke/zen-mode.nvim")
        use {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }
        use("github/copilot.vim")
        -- Themes
        use("tanvirtin/monokai.nvim")

        use("EdenEast/nightfox.nvim")
        use("sainnhe/gruvbox-material")
        use("jacoborus/tender.vim")
        use("sjl/badwolf")
        use("Mofiqul/vscode.nvim")
        use("sainnhe/sonokai")
        use("luisiacc/gruvbox-baby")
        use("navarasu/onedark.nvim")

        use {
            'https://gitlab.com/__tpb/monokai-pro.nvim',
            as = 'monokai-pro.nvim'
        }

        use("chrisbra/Colorizer")
        use("folke/neodev.nvim")
        use("wfxr/minimap.vim")
        use("nvim-tree/nvim-web-devicons")

        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly' -- optional, updated every week. (see issue #1193)
        }
        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true }
        }


        use{"folke/trouble.nvim",
            requires = {
                'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
        }
        use("ggandor/leap.nvim")
        use("tpope/vim-repeat")
        use("tpope/vim-eunuch")
        use("christoomey/vim-tmux-navigator")
        use("voldikss/vim-floaterm")
        -- use("lukas-reineke/indent-blankline.nvim")
        use("RRethy/vim-illuminate")
        use("chrisbra/NrrwRgn")
        use("simrat39/symbols-outline.nvim")
        use { "romgrk/barbar.nvim", requires = "nvim-web-devicons" }

        use {
            "SmiteshP/nvim-navbuddy",
            requires = {
                "neovim/nvim-lspconfig",
                "SmiteshP/nvim-navic",
                "MunifTanjim/nui.nvim"
            }
        }
    end)
