return {
    "nvim-lua/popup.nvim", -- Dependency (popup API implementation for neovim)
    "nvim-lua/plenary.nvim", -- Dependency (lots of useful lua functions)
    "kyazdani42/nvim-web-devicons", -- Dependency (icons)

    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "b0o/SchemaStore.nvim", -- json schmemas
    "christianchiarulli/lua-dev.nvim", -- developer setup for init.lua and plugin development
    "SmiteshP/nvim-navic", -- show current code context in a bar
    "ray-x/lsp_signature.nvim", -- show function signature as you type
    "lvimuser/lsp-inlayhints.nvim", -- inlay hints used for e.g. tsserver
    "simrat39/rust-tools.nvim", -- rust specific stuff

    -- Misc
    {
        "iamcco/markdown-preview.nvim",
        build = "cd app && npm install",
        ft = "markdown",
    },
    "famiu/bufdelete.nvim", -- proper bdelete command which never closes nvim ]]
    { "echasnovski/mini.ai", branch = "stable" }, -- extend functionality of a and i text objects
    "michaeljsmith/vim-indent-object", -- indent text object
    "christoomey/vim-titlecase", -- provides a new operator for giving text titlecase
    "lambdalisue/suda.vim", -- sudo read and write for nvim
}
