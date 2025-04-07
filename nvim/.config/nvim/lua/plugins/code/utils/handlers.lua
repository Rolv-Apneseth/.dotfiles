local icons = require("core.icons")
local keymappings = require("core.keymappings")
local servers_to_disable_formatting = { "tsserver", "sumneko_lua" }
local blink_cmp = require("blink.cmp")

local handlers = {}

handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true
handlers.capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}

handlers.capabilities = blink_cmp.get_lsp_capabilities(handlers.capabilities)

handlers.setup = function()
    vim.diagnostic.config({
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
            text = {
                [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
                [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
                [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
                [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
            },
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
