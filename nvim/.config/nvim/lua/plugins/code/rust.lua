return {
    "mrcjkb/rustaceanvim", -- Rust specific stuff
    ft = "rust",
    config = function()
        vim.g.rustaceanvim = {

            tools = {
                reload_workspace_from_cargo_toml = true,
                enable_clippy = true,
                enable_nextest = false,
                hover_actions = {
                    replace_builtin_hover = false,
                    auto_focus = false,
                    border = "rounded",
                    width = 60,
                },
            },
            server = {
                on_attach = function(client, bufnr)
                    require("plugins.code.utils.handlers").on_attach(client, bufnr)
                end,
                capabilities = require("plugins.code.utils.handlers").capabilities,
                settings = {
                    ["rust-analyzer"] = {
                        lens = {
                            enable = true,
                        },
                        check = {
                            command = "clippy",
                            extraArgs = { "--all", "--", "-W", "clippy::all" },
                        },
                        cargo = {
                            autoReload = true,
                            features = "all",
                        },
                        procMacro = {
                            ignored = {
                                leptos_macro = {
                                    -- "component",
                                    "server",
                                },
                            },
                        },
                    },
                },
            },
        }
    end,
    keys = {
        { "<leader>ir", ":RustLsp runnables<CR>", desc = "Runnables", ft = "rust" },
        { "<leader>iR", ":RustLsp openDocs<CR>", desc = "Open docs.rs docs", ft = "rust" },
        { "<leader>id", ":RustLsp debuggables<CR>", desc = "Debuggables", ft = "rust" },
        { "<leader>iD", ":RustLsp renderDiagnostic<CR>", desc = "Render diagnostic", ft = "rust" },
        { "<leader>ie", ":RustLsp explainError<CR>", desc = "Explain error", ft = "rust" },
        { "<leader>iJ", ":RustLsp joinLines<CR>", desc = "Join lines", ft = "rust" },
        { "<leader>ic", ":RustLsp openCargo<CR>", desc = "Open Cargo.toml", ft = "rust" },
        { "<leader>ip", ":RustLsp parentModules<CR>", desc = "Open parent module", ft = "rust" },
    },
}
