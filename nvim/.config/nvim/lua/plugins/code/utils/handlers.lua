local icons = require("core.icons")
local keymappings = require("core.keymappings")
local servers_to_disable_formatting = { "tsserver", "sumneko_lua" }
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local handlers = {}

handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true
handlers.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

handlers.capabilities = cmp_nvim_lsp.default_capabilities(handlers.capabilities)

handlers.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        {
            name = "DiagnosticSignInfo",
            text = icons.diagnostics.Information,
        },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        virtual_lines = false,
        virtual_text = {
            spacing = 4,
            update_in_insert = false,
            severity_sort = true,
            prefix = icons.ui.Circle,
            source = "if_many", -- Or "always"
        },
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "if_many", -- Or "always"
            header = "",
            prefix = "",
            -- width = 40,
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        -- width = 60,
        -- height = 30,
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        -- width = 60,
        -- height = 30,
    })
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    for _, mapping in pairs(keymappings.lsp) do
        keymap(bufnr, "n", mapping[1], mapping[2], opts)
    end
end

handlers.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    -- Native inlay hints
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true)
    end

    for _, server in pairs(servers_to_disable_formatting) do
        if client.name == server then
            client.server_capabilities.documentFormattingProvider = false
        end
    end
end

return handlers
