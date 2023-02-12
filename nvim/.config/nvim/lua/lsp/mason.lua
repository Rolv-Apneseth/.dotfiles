local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")

local mason = require_plugin("mason")
local lspconfig = require_plugin("lspconfig")
local mason_lspconfig = require_plugin("mason-lspconfig")
if not mason or not lspconfig or not mason_lspconfig then
    vim.notify("Error with mason config")
    return
end

local servers = {
    "cssls",
    "emmet_ls",
    "html",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "pyright",
    "yamlls",
    "bashls",
    "rust_analyzer",
}

local settings = {
    ui = {
        border = "rounded",
        icons = {
            package_installed = icons.ui.Check,
            package_pending = icons.ui.Next,
            package_uninstalled = icons.ui.Wrong,
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach = require("lsp.handlers").on_attach,
        capabilities = require("lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    if server == "jsonls" then
        local jsonls_opts = require("lsp.settings.jsonls")
        opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    end

    if server == "yamlls" then
        local yamlls_opts = require("lsp.settings.yamlls")
        opts = vim.tbl_deep_extend("force", yamlls_opts, opts)
    end

    if server == "sumneko_lua" then
        local lua_dev = require_plugin("lua-dev")
        if not lua_dev then
            goto continue
        end

        lspconfig.sumneko_lua.setup(lua_dev.setup({
            lspconfig = {
                on_attach = opts.on_attach,
                capabilities = opts.capabilities,
            },
        }))
        goto continue
    end

    if server == "tsserver" then
        local tsserver_opts = require("lsp.settings.tsserver")
        opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
    end

    if server == "pyright" then
        local pyright_opts = require("lsp.settings.pyright")
        opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    end

    if server == "emmet_ls" then
        local emmet_ls_opts = require("lsp.settings.emmet_ls")
        opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
    end

    if server == "rust_analyzer" then
        local rust_opts = require("lsp.settings.rust")
        local rust_tools = require_plugin("rust-tools")
        if not rust_tools then
            return
        end

        rust_tools.setup(rust_opts)
        goto continue
    end

    --[[ if server == "jdtls" then ]]
    --[[      ]]
    --[[ end ]]

    lspconfig[server].setup(opts)
    ::continue::
end
