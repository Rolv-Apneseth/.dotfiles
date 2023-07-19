local M = {}

local keymappings = require("core.keymappings")
local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")
local servers_to_disable_formatting = { "tsserver", "sumneko_lua" }

M.capabilities = vim.lsp.protocol.make_client_capabilities()

local cmp_nvim_lsp = require_plugin("cmp_nvim_lsp")
if not cmp_nvim_lsp then
    return
end

M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(
            sign.name,
            { texthl = sign.name, text = sign.text, numhl = "" }
        )
    end

    local config = {
        virtual_lines = false,
        virtual_text = {
            spacing = 4,
            update_in_insert = false,
            severity_sort = true,
            prefix = icons.ui.Circle,
            source = "if_many", -- Or "always"
            -- format = function(diag)
            --   return diag.message .. "blah"
            -- end,
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
            -- border = {"▄","▄","▄","█","▀","▀","▀","█"},
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

    vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "rounded",
            -- width = 60,
            -- height = 30,
        })
end

local function attach_navic(client, bufnr)
    local nvim_navic = require_plugin("nvim-navic")
    if not nvim_navic then
        return
    end

    nvim_navic.attach(client, bufnr)
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap

    for _, mapping in pairs(keymappings.lsp) do
        keymap(bufnr, "n", mapping[1], mapping[2], opts)
    end
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)

    vim.notify(client)
    for _, server in pairs(servers_to_disable_formatting) do
        if client.name == server then
            client.server_capabilities.documentFormattingProvider = false
        end
    end

    if client.server_capabilities.documentSymbolProvider then
        attach_navic(client, bufnr)
    end
end

return M
