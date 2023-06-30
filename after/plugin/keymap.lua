local which_key = require("which-key")

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
    d = {
        name = "Debug",
        b = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Toggle Breakpoint" },
        r = { "<cmd>lua require('dap').repl.open()<CR>", "Open Repl" },
    },
    f = {
        name = "Find",
        b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
        c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        t = { "<cmd>Telescope live_grep<cr>", "Find Text" },
        s = { "<cmd>Telescope grep_string<cr>", "Find String" },
        h = { "<cmd>Telescope help_tags<cr>", "Help" },
        H = { "<cmd>Telescope highlights<cr>", "Highlights" },
        i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
        l = { "<cmd>Telescope resume<cr>", "Last Search" },
        M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
        r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
        R = { "<cmd>Telescope registers<cr>", "Registers" },
        k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
        C = { "<cmd>Telescope commands<cr>", "Commands" },
    },
    i = {
        name = "Packer",
        s = { "<cmd>PackerSync<cr>", "Sync" }
    },
    l = {
        name = "LSP",
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
        c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
        d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
        w = {
            "<cmd>Telescope lsp_workspace_diagnostics<cr>",
            "Workspace Diagnostics",
        },
        f = { "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", "Format" },
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
        F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
        i = { "<cmd>LspInfo<cr>", "Info" },
        h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
        n = { "<cmd>lua vim.diagnostic.goto_next() <cr>", "Go to next Diagnostic" },
        p = { "<cmd>lua vim.diagnostic.goto_prev() <cr>", "Go to previous Diagnostic" },
        H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
        I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
        j = {
            "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
            "Next Diagnostic",
        },
        l = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle lsp_lines" },
    },
    t = {
        name = "terminal",
        n = { "<cmd>FloatermNew --width=0.8 --height=0.8 <cr>", "New Pane" },
        h = { "<cmd>FloatermPrev<cr>", "Previous Pane" },
        l = { "<cmd>FloatermNext<cr>", "Next Pane" },
        t = { "<cmd>FloatermToggle <cr>", "Toggle Floaterm" },
        q = { "<cmd>FloatermKill<cr>", "Kill Pane" },
        g = { "<cmd>FloatermNew --width=1.0 --height=1.0 lazygit<cr>", "Lazygit" },
    },
}

local g_opts = {
    mode = "n", -- Floaterm mode
    prefix = "g",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local g_mappings = {
    name = "Go",
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Implementation" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
    t = { "<cmd> BufferNext<cr>", "Go to next Tab" },
    T = { "<cmd> BufferNext<cr>", "Go to previous Tab" },
}

local direct_opts = {
    mode = "n", -- Floaterm mode
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local direct_mappings = {
    name = "Direct",
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover Symbol" },
    ["<F5>"] = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
    ["<F6>"] = { "<cmd>lua require('dap').step_over()<CR>", "Step over" },
    ["<F7>"] = { "<cmd>lua require('dap').step_into()<CR>", "Step into" },
}

local t_opts = {
    mode = "t", -- Floaterm mode
    prefix = "",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local t_mappings = {
    name = "terminal",
    ["<c-n>"] = { "<cmd>FloatermNew<cr>", "New Pane" },
    ["<c-k>"] = { "<cmd>FloatermPrev<cr>", "Previous Pane" },
    ["<c-j>"] = { "<cmd>FloatermNext<cr>", "Next Pane" },
    ["<c-t>"] = { "<cmd>FloatermToggle<cr>", "Toggle Floaterm" },
    ["<c-q>"] = { "<cmd>FloatermKill<cr>", "Kill Pane" },
}

which_key.register(mappings, opts)
which_key.register(v_mappings, v_opts)
which_key.register(t_mappings, t_opts)
which_key.register(m_mappings, m_opts)
which_key.register(g_mappings, g_opts)
which_key.register(direct_mappings, direct_opts)
