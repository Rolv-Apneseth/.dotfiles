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
        { "<leader>cr", ":RustLsp runnables<CR>", desc = "Runnables" },
        { "<leader>cR", ":RustLsp openDocs<CR>", desc = "Open docs.rs docs" },
        { "<leader>cd", ":RustLsp debuggables<CR>", desc = "Debuggables" },
        { "<leader>cD", ":RustLsp renderDiagnostic<CR>", desc = "Render diagnostic" },
        { "<leader>ce", ":RustLsp explainError<CR>", desc = "Explain error" },
        { "<leader>cJ", ":RustLsp joinLines<CR>", desc = "Join lines" },
        { "<leader>cc", ":RustLsp openCargo<CR>", desc = "Open Cargo.toml" },
        { "<leader>cp", ":RustLsp parentModules<CR>", desc = "Open parent module" },
    },
}
