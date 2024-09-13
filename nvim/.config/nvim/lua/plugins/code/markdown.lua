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
            { "i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>", ft = "markdown" },
            { "n", "o", "o<cmd>AutolistNewBullet<cr>", ft = "markdown" },
            { "n", "O", "O<cmd>AutolistNewBulletBefore<cr>", ft = "markdown" },
            { "n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>", ft = "markdown" },

            -- recalculate ordered list on edit
            { "n", ">>", ">><cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "n", "<<", "<<<cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "n", "dd", "dd<cmd>AutolistRecalculate<cr>", ft = "markdown" },
            { "v", "d", "d<cmd>AutolistRecalculate<cr>", ft = "markdown" },
        },
    },
}
