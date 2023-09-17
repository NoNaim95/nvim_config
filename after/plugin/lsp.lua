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
    'lua_ls',
    'rust_analyzer',
    'pyright',
    'clangd',
})

lsp.configure('lua_ls', {
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

lsp.configure('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                enable = true,
                allFeatures = true,
                overrideCommand = {
                    'cargo', 'clippy', '--workspace', '--message-format=json',
                    '--all-targets', '--all-features'
                }
            }
        }
    }
})


local function dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end

local on_format = function(err, result, ctx, config)
    vim.lsp.handlers["textDocument/formatting"](err, result, ctx, config)
    print(dump(ctx.params))
end

lsp.configure('clangd', {
    handlers = {
        ["textDocument/formatting"] = vim.lsp.with(
            on_format,
            {

            }
        )
    },
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        group = vim.api.nvim_create_augroup("my_group", { clear = true }),
        callback = function()
            vim.lsp.buf.format({ async = true })
        end,
    }
)

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
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false
        }),
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp', keyword_length = 1 },
        { name = 'luasnip',  keyword_length = 2 },
        { name = 'buffer',   keyword_length = 3 },
    },
})

local navbuddy = require("nvim-navbuddy")
lsp.on_attach(
    function(client, bufnr)
        client.server_capabilities.semanticTokensProvider = nil
        local navic = require("nvim-navic")
        navic.attach(client, bufnr)
        navbuddy.attach(client, bufnr)
    end
)





lsp.setup()
