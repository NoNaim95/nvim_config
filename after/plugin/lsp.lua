local lsp = require("lsp-zero")
local luasnip = require("luasnip")
lsp.preset("recommended")


require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
})

local lspconfig = require('lspconfig')

lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})


lsp.ensure_installed({
  'tsserver',
  'eslint',
  'sumneko_lua',
  'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')

cmp.setup{
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }),
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
}

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})


-- disable completion with tab
-- this helps with copilot setup
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "<leader>vd",     vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d",             vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d",             vim.diagnostic.goto_prev, opts)

  vim.keymap.set("n", "gd",             vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K",              vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>vws",    vim.lsp.buf.workspace_symbol, opts)
  vim.keymap.set("n", "<leader>vca",    vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>vrr",    vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>vrn",    vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>",          vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})


vim.api.nvim_set_var("g:cmp_completion_trigger_character", "inclusive")
vim.api.nvim_set_var("g:lsp_completion_trigger_character", "inclusive")

