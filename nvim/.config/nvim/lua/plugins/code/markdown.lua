return {
    {
        "jannis-baum/vivify.vim", -- Preview markdown files in the browser using `vivify`
        lazy = true,
        keys = {
            { "<leader>ip", ":Vivify<CR>", desc = "Preview using vivify", ft = "markdown" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim", -- Improved rendering for markdown files in nvim itself
        ft = "markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
        opts = {
            heading = {
                sign = false,
                width = "block",
                min_width = 100,
            },
            code = {
                sign = false,
                width = "block",
                min_width = 100,
                highlight = "Normal",
                below = "",
            },
        },
    },
    {
        "Kicamon/markdown-table-mode.nvim", -- Format markdown tables
        lazy = true,
        opts = {
            options = {
                insert = true, -- when typing "|"
                insert_leave = true, -- when leaving insert
                pad_separator_line = true, -- add space in separator line
            },
        },
        keys = {
            {
                "<leader>it",
                "<cmd>Mtm<cr>",
                ft = "markdown",
                desc = "Toggle table mode",
            },
        },
    },
    {
        "richardbizik/nvim-toc", -- Table of contents generation
        lazy = true,
        opts = {
            toc_header = "Table of Contents",
        },
        keys = {
            {
                "<leader>ic",
                "<cmd>TOC<cr>",
                ft = "markdown",
                desc = "Generate table of contents (numbered)",
            },
            {
                "<leader>iC",
                "<cmd>TOCList<cr>",
                ft = "markdown",
                desc = "Generate table of contents (list)",
            },
        },
    },
}
