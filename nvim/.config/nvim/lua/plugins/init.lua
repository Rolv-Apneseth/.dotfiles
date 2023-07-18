return {
    -- Base Dependencies
    "nvim-lua/popup.nvim", -- popup API implementation for neovim
    "nvim-lua/plenary.nvim", -- lots of useful lua functions
    "kyazdani42/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim", -- ui component library

    -- LSP
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "b0o/SchemaStore.nvim", -- json schmemas
    "folke/neodev.nvim", -- neovim lua setup
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
    { "echasnovski/mini.ai", branch = "stable" }, -- extend functionality of a and i text objects
    "michaeljsmith/vim-indent-object", -- indent text object
    "christoomey/vim-titlecase", -- provides a new operator for giving text titlecase
    "lambdalisue/suda.vim", -- sudo read and write for nvim
}
