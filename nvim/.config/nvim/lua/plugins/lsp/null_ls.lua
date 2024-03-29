-- Requirements
-- prettier tidy stylua flake8 python-isort python-black shellcheck-bin shellharden rustup markdownlint rustywind

local require_plugin = require("core.helpers").require_plugin
local constants = require("core.constants")

return {
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    config = function()
        local null_ls = require_plugin("null-ls")
        if not null_ls then
            return
        end

        local formatting = null_ls.builtins.formatting
        local diagnostics = null_ls.builtins.diagnostics

        null_ls.setup({
            debug = false,
            sources = {
                -- HTML, CSS, JS, TS, Markdown, Yaml etc.
                formatting.prettier.with({
                    extra_filetypes = { "toml" },
                    filetypes = {
                        "javascript",
                        "javascriptreact",
                        "typescript",
                        "typescriptreact",
                        "vue",
                        "css",
                        "scss",
                        "less",
                        "html",
                        "json",
                        "jsonc",
                        "yaml",
                        -- using markdownlint for markdown
                        --[[ "markdown", ]]
                        --[[ "markdown.mdx", ]]
                        "graphql",
                        "handlebars",
                    },
                    extra_args = { "--tab-width", constants.TAB_WIDTH },
                }),
                diagnostics.eslint,

                -- HTML Linting
                diagnostics.tidy,

                -- Tailwind CSS
                formatting.rustywind,

                -- Markdown
                diagnostics.markdownlint.with({
                    extra_args = {
                        "--disable",
                        "MD013", -- line-length
                    },
                }),
                formatting.markdownlint,

                -- Rust
                formatting.rustfmt,

                -- Lua
                formatting.stylua.with({
                    extra_args = {
                        "--column-width",
                        constants.LINE_LENGTH,
                        "--indent-width",
                        constants.TAB_WIDTH,
                        "--indent-type",
                        "Spaces",
                    },
                }),

                -- Python
                diagnostics.flake8.with({
                    extra_args = {
                        "--max-line-length",
                        constants.LINE_LENGTH,
                        "--ignore",
                        "E203, E266, E501, W503",
                    },
                }),
                formatting.black.with({
                    extra_args = { "--line-length", constants.LINE_LENGTH },
                }),
                formatting.isort.with({
                    extra_args = { "--line-length", constants.LINE_LENGTH },
                }),

                -- Shell
                diagnostics.shellcheck,
                diagnostics.zsh,
                formatting.shellharden,
                formatting.shfmt.with({
                    args = {
                        "--filename",
                        "$FILENAME",
                        "--indent",
                        constants.TAB_WIDTH,
                        "--binary-next-line",
                        "--case-indent",
                        "--space-redirects",
                        "--func-next-line",
                    },
                }),

                -- TOML
                formatting.taplo,
            },
        })

        local unwrap = {
            method = null_ls.methods.DIAGNOSTICS,
            filetypes = { "rust" },
            generator = {
                fn = function(params)
                    local generator_diagnostics = {}
                    -- sources have access to a params object
                    -- containing info about the current file and editor state
                    for i, line in ipairs(params.content) do
                        local col, end_col = line:find("unwrap()")
                        if col and end_col then
                            -- null-ls fills in undefined positions
                            -- and converts source diagnostics into the required format
                            table.insert(generator_diagnostics, {
                                row = i,
                                col = col,
                                end_col = end_col,
                                source = "unwrap",
                                message = "hey, don't forget to handle this",
                                severity = 2,
                            })
                        end
                    end
                    return generator_diagnostics
                end,
            },
        }

        null_ls.register(unwrap)
    end,
}
