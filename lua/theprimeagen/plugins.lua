local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'nvim-telescope/telescope.nvim',
        version = "0.1.0",
        -- or                            , branch = '0.1.x',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'nvim-treesitter/playground',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'theprimeagen/harpoon',
    'mbbill/undotree',
    'tpope/vim-fugitive',

    --LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        dependencies = {
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
    },
    "mfussenegger/nvim-dap",
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" }
    },
    {
        "SmiteshP/nvim-navic",
        dependencies = "neovim/nvim-lspconfig"
    },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",

    {
        'saecki/crates.nvim',
        version = "v0.3.0",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end,
    },
    "folke/zen-mode.nvim",
    {
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
    },
    "github/copilot.vim",
    -- Themes
    "tanvirtin/monokai.nvim",

    "EdenEast/nightfox.nvim",
    "sainnhe/gruvbox-material",
    "jacoborus/tender.vim",
    "sjl/badwolf",
    "Mofiqul/vscode.nvim",
    "sainnhe/sonokai",
    "luisiacc/gruvbox-baby",
    "navarasu/onedark.nvim",

    {
        'https://gitlab.com/__tpb/monokai-pro.nvim',
        name = 'monokai-pro.nvim'
    },

    "chrisbra/Colorizer",
    "folke/neodev.nvim",
    "wfxr/minimap.vim",
    "nvim-tree/nvim-web-devicons",

    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        version = "nightly"                -- optional, updated every week. (see issue #1193)
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', opt = true }
    },


    {
        "folke/trouble.nvim",
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
    },
    "ggandor/leap.nvim",
    "tpope/vim-repeat",
    "tpope/vim-eunuch",
    "christoomey/vim-tmux-navigator",
    "voldikss/vim-floaterm",
    -- use("lukas-reineke/indent-blankline.nvim")
    "RRethy/vim-illuminate",
    "chrisbra/NrrwRgn",
    "simrat39/symbols-outline.nvim",
    { "romgrk/barbar.nvim",              dependencies = "nvim-web-devicons" },

    {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
            "neovim/nvim-lspconfig",
            "SmiteshP/nvim-navic",
            "MunifTanjim/nui.nvim"
        }
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }
}

local opts = {}
require("lazy").setup(plugins, opts)
