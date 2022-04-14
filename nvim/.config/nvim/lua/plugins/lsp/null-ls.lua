local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

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
                "89",
                "--indent-width",
                "4",
                "--indent-type",
                "Spaces",
            },
        }),

        -- Python
        diagnostics.flake8.with({ extra_args = { "--max-line-length", "89" } }),
        formatting.black.with({ extra_args = { "--line-length", "89" } }),
        formatting.isort.with({ extra_args = { "--line-length", "89" } }),

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
