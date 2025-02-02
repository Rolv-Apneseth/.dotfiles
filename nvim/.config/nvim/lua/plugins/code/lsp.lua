local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")

return {
    "williamboman/mason.nvim", -- Managing + installing LSP servers and more
    dependencies = {
        "neovim/nvim-lspconfig",
        "williamboman/mason-lspconfig.nvim",
        "tamago324/nlsp-settings.nvim", -- language server settings defined in json

        {
            -- Here because it must be loaded before the lua lsp setup
            "folke/lazydev.nvim", -- LuaLS setup for editing Neovim config
            ft = "lua",
            dependencies = {
                { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
                { -- optional completion source for require statements and module annotations
                    "hrsh7th/nvim-cmp",
                    opts = function(_, opts)
                        opts.sources = opts.sources or {}
                        table.insert(opts.sources, {
                            name = "lazydev",
                            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
                        })
                    end,
                },
            },
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "luvit-meta/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    config = function()
        local mason = require_plugin("mason")
        local lspconfig = require_plugin("lspconfig")
        local mason_lspconfig = require_plugin("mason-lspconfig")
        if not mason or not lspconfig or not mason_lspconfig then
            vim.notify("Error with mason config")
            return
        end

        local handlers = require("plugins.code.utils.handlers")
        handlers.setup()

        local servers = {
            "cssls",
            "emmet_ls",
            "html",
            "jsonls",
            "lua_ls",
            "ts_ls",
            "pyright",
            "yamlls",
            "bashls",
            "rust_analyzer",
            "omnisharp",
            "gopls",
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
                local lua_opts = require("plugins.code.settings.lua_ls")
                opts = vim.tbl_deep_extend("force", lua_opts, opts)
            end

            if server == "ts_ls" then
                local ts_ls_opts = require("plugins.code.settings.ts_ls")
                opts = vim.tbl_deep_extend("force", ts_ls_opts, opts)
            end

            if server == "pyright" then
                local pyright_opts = require("plugins.code.settings.pyright")
                opts = vim.tbl_deep_extend("force", pyright_opts, opts)
            end

            if server == "emmet_ls" then
                local emmet_ls_opts = require("plugins.code.settings.emmet_ls")
                opts = vim.tbl_deep_extend("force", emmet_ls_opts, opts)
            end

            if server == "rust_analyzer" then
                -- Handled in rust.lua
                goto continue
            end

            if server == "omnisharp" then
                local omnisharp_opts = require("plugins.code.settings.omnisharp")
                opts = vim.tbl_deep_extend("force", omnisharp_opts, opts)
            end

            lspconfig[server].setup(opts)
            ::continue::
        end
    end,
}
