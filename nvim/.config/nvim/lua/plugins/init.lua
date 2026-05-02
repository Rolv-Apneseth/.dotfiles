return {
    -- Base Dependencies
    "nvim-lua/popup.nvim", -- popup API implementation for neovim
    "nvim-lua/plenary.nvim", -- lots of useful lua functions
    "nvim-tree/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim", -- UI component library

    -- Misc
    "famiu/bufdelete.nvim", -- delete buffers without changing window layout, and provides useful events for autocommands
    {
        "NoahTheDuke/vim-just", -- syntax highlighting for `justfile`
        ft = { "just" },
    },
    {
        "fymyte/rasi.vim", -- syntax highlighting for rofi `.rasi` files
        ft = { "rasi" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
