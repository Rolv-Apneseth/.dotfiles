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
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {
            heading = {
                sign = false,
                width = "block",
                min_width = 100,
            },
            code = {
                enabled = true,
                sign = false,
                conceal_delimiters = true,
                language = false,
                border = "hide",
                width = "block",
                min_width = 100,
                highlight = "Normal",
                below = "",
            },
            link = {
                enabled = true,
                footnote = {
                    -- Turn on / off footnote rendering.
                    enabled = true,
                    -- Inlined with content.
                    icon = "󰯔 ",
                    -- Custom processing for footnote body to show.
                    -- Runs before prefix / suffix are added and superscript processing.
                    body = function(ctx)
                        return ctx.text
                    end,
                    -- Replace value with superscript equivalent.
                    superscript = true,
                    -- Added before link content.
                    prefix = "",
                    -- Added after link content.
                    suffix = "",
                },
                image = "󰥶 ",
                email = "󰇮 ",
                hyperlink = "󰌹 ",
                -- Applies to WikiLink elements.
                wiki = {
                    -- Turn on / off WikiLink rendering.
                    enabled = true,
                    -- Inlined with content.
                    icon = "󱗖 ",
                    -- Custom processing for WikiLink body to show.
                    body = function()
                        return nil
                    end,
                    -- Applies to the inlined icon.
                    highlight = "RenderMarkdownWikiLink",
                    -- Highlight for item associated with the WikiLink.
                    scope_highlight = nil,
                },
                custom = {
                    web = { pattern = "^http", icon = "󰖟 " },
                    github = { pattern = "github%.com", icon = "󰊤 " },
                    gitlab = { pattern = "gitlab%.com", icon = "󰮠 " },
                    neovim = { pattern = "neovim%.io", icon = " " },
                    slack = { pattern = "slack%.com", icon = "󰒱 " },
                    stackoverflow = { pattern = "stackoverflow%.com", icon = "󰓌 " },
                    wikipedia = { pattern = "wikipedia%.org", icon = "󰖬 " },
                    youtube = { pattern = "youtube[^.]*%.com", icon = "󰗃 " },
                },
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
