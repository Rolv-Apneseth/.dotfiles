-- REQUIRED EXTERNAL BINARIES
-- prettierd/prettier stylua python-isort python-black shellharden shfmt rustup markdownlint rustywind taplo-cli just nixfmt fixjson typos gofumpt goimports-reviser

local constants = require("core.constants")

local JS_FORMATTERS = { "prettier", "rustywind" }

return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    init = function()
        vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    end,
    opts = {
        notify_on_error = true,

        format_on_save = {
            format_on_save = function(bufnr)
                -- Disable autoformat on certain file types
                local ignore_filetypes = { "svg" }
                if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
                    return
                end
                -- Disable autoformat for files in a certain path
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname:match("/node_modules/") then
                    return
                end
                return { timeout_ms = 500, lsp_fallback = true }
            end,
        },

        formatters_by_ft = {
            -- For all file types
            --[[ ["*"] = { "typos" }, ]]
            -- For file types that don't have other formatters configured
            ["_"] = { "trim_whitespace" },

            lua = { "stylua" },
            python = { "isort", "autopep8", "black" },
            markdown = { "markdownlint" },
            rust = { "rustfmt", "leptosfmt" },
            sh = { "shellharden", "shfmt" },
            zsh = { "shellharden", "shfmt" },
            toml = { "taplo" },
            just = { "just" },
            nix = { "nixfmt" },
            json = { "fixjson" },
            go = { "gofumpt", "goimports-reviser" },

            -- 😥
            javascript = JS_FORMATTERS,
            javascriptreact = JS_FORMATTERS,
            typescript = JS_FORMATTERS,
            typescriptreact = JS_FORMATTERS,
            css = JS_FORMATTERS,
            scss = JS_FORMATTERS,
            html = JS_FORMATTERS,
        },

        formatters = {
            prettier = {
                prepend_args = {
                    "--tab-width",
                    constants.TAB_WIDTH,
                },
            },
            markdownlint = {
                prepend_args = {
                    "--disable",
                    "MD013", -- line-length
                },
            },
            leptosfmt = {
                prepend_args = {
                    "--experimental-tailwind",
                },
            },
            stylua = {
                prepend_args = {
                    "--column-width",
                    constants.LINE_LENGTH,
                    "--indent-width",
                    constants.TAB_WIDTH,
                    "--indent-type",
                    "Spaces",
                },
            },
            shfmt = {
                prepend_args = {
                    "--indent",
                    constants.TAB_WIDTH,
                    "--binary-next-line",
                    "--case-indent",
                    "--space-redirects",
                    "--func-next-line",
                },
            },
        },
    },
}
