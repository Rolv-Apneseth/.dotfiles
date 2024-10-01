return {
    -- Base Dependencies
    "nvim-lua/popup.nvim", -- popup API implementation for neovim
    "nvim-lua/plenary.nvim", -- lots of useful lua functions
    "nvim-tree/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim", -- UI component library

    -- Misc
    "famiu/bufdelete.nvim", -- delete buffers without changing window layout, and provides useful events for autocommands
    {
        "lambdalisue/suda.vim", -- sudo read and write for editing a file without running `sudo nvim`
        init = function()
            -- automatically switch a buffer name when the target file is not readable or writable
            vim.g.suda_smart_edit = 1
        end,
    },
    {
        "NoahTheDuke/vim-just", -- syntax highlighting for `justfile`
        ft = { "just" },
    },
    {
        "fymyte/rasi.vim", -- syntax highlighting for rofi `.rasi` files
        ft = { "rasi" },
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
    {
        "mei28/luminate.nvim", -- Highlight yanked, pasted and undone/redone
        event = { "VeryLazy" },
        opts = {
            duration = 100, -- Duration of the highlight in milliseconds
        },
    },
}
