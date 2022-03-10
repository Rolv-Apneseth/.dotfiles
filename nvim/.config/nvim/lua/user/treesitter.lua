local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
    -- EXTENSIONS
    -- Autopair brackets, strings etc. (windwp/nvim-autopairs)
    autopairs = {
        enable = true,
    },
    -- Context based commentstring (JoosepAlviste/nvim-ts-context-commentstring)
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },

    -- Rainbow brackets (p00f/nvim-ts-rainbow)
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
    },
})
