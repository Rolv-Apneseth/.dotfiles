return {
    {
        "jannis-baum/vivify.vim", -- Preview markdown files in the browser using `vivify`
        ft = {
            "markdown",
        },
        config = function() end,
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
        ft = "markdown",
        opts = {
            options = {
                insert = true, -- when typing "|"
                insert_leave = true, -- when leaving insert
            },
        },
    },
    {
        "gaoDean/autolist.nvim", -- Auto list continuation and recalculation
        ft = {
            "markdown",
        },
        opts = {},
        keys = {
            { "<CR>", "<CR><cmd>AutolistNewBullet<cr>", ft = "markdown", mode = "i" },
            { "o", "o<cmd>AutolistNewBullet<cr>", ft = "markdown" },
            { "O", "O<cmd>AutolistNewBulletBefore<cr>", ft = "markdown" },
            { "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", ft = "markdown" },

            -- recalculate ordered list on edit
            { ">>", ">><cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "<<", "<<<cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "dd", "dd<cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "d", "d<cmd>AutolistRecalculate<cr>", ft = "markdown", mode = "v" },
        },
    },
    {
        "richardbizik/nvim-toc", -- Table of contents generation
        ft = "markdown",
        opts = {
            toc_header = "Table of Contents",
        },
        keys = {
            {
                "<leader>it",
                "<cmd>TOC<cr>",
                ft = "markdown",
                desc = "Generate table of contents (numbered)",
            },
            {
                "<leader>il",
                "<cmd>TOCList<cr>",
                ft = "markdown",
                desc = "Generate table of contents (list)",
            },
        },
    },
}
