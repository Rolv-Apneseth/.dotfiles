return {
    -- Base Dependencies
    "nvim-lua/popup.nvim", -- popup API implementation for neovim
    "nvim-lua/plenary.nvim", -- lots of useful lua functions
    "kyazdani42/nvim-web-devicons", -- icons
    "MunifTanjim/nui.nvim", -- ui component library

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
}
