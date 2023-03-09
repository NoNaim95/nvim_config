local lsp = require("lsp-zero")
local cmp = require('cmp')
local luasnip = require("luasnip")

vim.diagnostic.config({
  virtual_text = false, --for lsp_lines
})

vim.opt.signcolumn = 'yes'
lsp.preset("recommended")
lsp.nvim_workspace()
require("neodev").setup({})

lsp.set_preferences({
  set_lsp_keymaps = false,
  manage_nvim_cmp = true,
})

lsp.ensure_installed({
    'sumneko_lua',
    'rust_analyzer',
    'pyright',
    'clangd',
})

lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            -- Fix Undefined global 'vim'
            diagnostics = {
                globals = { 'vim' }
            },
            completion = {
                callSnippet = "Replace"
            }
        }
    }
})

lsp.setup_nvim_cmp({
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.confirm()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
                -- this will auto complete if our cursor in next to a word and we press tab
                -- elseif has_words_before() then
                --     cmp.complete()
            else
                fallback()
            end
        end, {"i", "s"}),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {"i", "s"}),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        {name = 'path'},
        {name = 'nvim_lsp', keyword_length = 1},
        {name = 'luasnip', keyword_length = 2},
        {name = 'buffer', keyword_length = 3},
    },
})


lsp.on_attach(
    function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
    end)

lsp.setup()
