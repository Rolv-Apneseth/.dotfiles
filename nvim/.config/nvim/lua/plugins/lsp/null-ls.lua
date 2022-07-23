local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

local constants = require("core/constants")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        -- HTML, CSS, JS, TS, Markdown, Yaml etc.
        formatting.prettier.with({ extra_args = { "--tab-width", "4" } }),
        -- HTML Linting
        diagnostics.tidy,

        -- Lua
        formatting.stylua.with({
            extra_args = {
                "--column-width",
                constants.LINE_LENGTH,
                "--indent-width",
                "4",
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
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
