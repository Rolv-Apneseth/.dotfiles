return {
    "folke/neodev.nvim", -- neovim lua setup
    opts = {
        library = {
            enabled = true,              -- when not enabled, neodev will not change any settings to the LSP server
            -- these settings will be used for your Neovim config directory
            runtime = true,              -- runtime path
            types = true,                -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = { "nvim-dap-ui" }, -- installed opt or start plugins in packpath
        },
        setup_jsonls = true,             -- configures jsonls to provide completion for project specific .luarc.json files
        lspconfig = true,
        pathStrict = true,
    },
}
