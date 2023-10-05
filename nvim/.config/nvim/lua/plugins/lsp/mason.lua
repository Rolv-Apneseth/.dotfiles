local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")

return {
    "williamboman/mason.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "tamago324/nlsp-settings.nvim", -- language server settings defined in json
    },
    config = function()
        local mason = require_plugin("mason")
        local lspconfig = require_plugin("lspconfig")
        local mason_lspconfig = require_plugin("mason-lspconfig")
        if not mason or not lspconfig or not mason_lspconfig then
            vim.notify("Error with mason config")
            return
        end

        local handlers = require("plugins.lsp.utils.handlers")
        handlers.setup()

        local servers = {
            "cssls",
            "emmet_ls",
            "html",
            "jsonls",
            "lua_ls",
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
                on_attach = handlers.on_attach,
                capabilities = handlers.capabilities,
            }

            server = vim.split(server, "@")[1]

            if server == "lua_ls" then
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                })
                goto continue
            end

            if server == "tsserver" then
                local tsserver_opts = require("plugins.lsp.settings.tsserver")
                opts = vim.tbl_deep_extend("force", tsserver_opts, opts)
            end

            if server == "pyright" then
                local pyright_opts = require("plugins.lsp.settings.pyright")
                opts = vim.tbl_deep_extend("force", pyright_opts, opts)
            end

            if server == "emmet_ls" then
                local emmet_ls_opts = require("plugins.lsp.settings.emmet_ls")
                opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
            end

            if server == "rust_analyzer" then
                -- Handled in rust_tools.lua
                goto continue
            end

            lspconfig[server].setup(opts)
            ::continue::
        end
    end,
}