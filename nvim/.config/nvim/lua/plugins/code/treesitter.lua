return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        -- Auto install parser for current file type and enable treesitter
        -- See: https://github.com/nvim-treesitter/nvim-treesitter/discussions/8546#discussioncomment-16441482
        config = function()
            local nvim_treesitter = require("nvim-treesitter")

            local function is_parser_installed(lang)
                local installed = nvim_treesitter.get_installed()
                return vim.tbl_contains(installed, lang)
            end

            local function is_parser_available(lang)
                local available = nvim_treesitter.get_available()
                return vim.tbl_contains(available, lang)
            end

            local function start_treesitter(buf, lang)
                if not vim.treesitter.language.add(lang) then
                    vim.notify(
                        "Cannot load treesitter parser for language " .. lang,
                        vim.log.levels.WARN
                    )
                    return
                end
                vim.treesitter.start(buf)
                vim.bo[buf].syntax = "ON"
                if vim.treesitter.query.get(lang, "indents") then
                    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end
            end

            vim.api.nvim_create_autocmd("FileType", {
                callback = function(ev)
                    local lang = vim.treesitter.language.get_lang(ev.match)
                    if not lang then
                        return
                    end
                    local buf = ev.buf
                    if is_parser_installed(lang) then
                        start_treesitter(buf, lang)
                    elseif is_parser_available(lang) then
                        nvim_treesitter.install({ lang }):await(function()
                            start_treesitter(buf, lang)
                        end)
                    end
                end,
            })
        end,
    },

    {
        -- Auto-tags for html, jsx, etc.
        "windwp/nvim-ts-autotag",
        opts = {
            opts = {
                -- Defaults
                enable_close = true, -- Auto close tags
                enable_rename = true, -- Auto rename pairs of tags
                enable_close_on_slash = false, -- Auto close on trailing </
            },
        },
    },

    {
        "windwp/nvim-autopairs", -- auto pair brackets, quotations etc.
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter-context", -- Show current context at the top of the window
        opts = {
            enable = true,
            max_lines = 5,
            min_window_height = 0,
            line_numbers = true,
            multiline_threshold = 10,
            trim_scope = "outer", -- inner | outer
            mode = "cursor", -- cursor | topline
            separator = "─",
        },
    },

    {
        "Wansmer/treesj", -- Join / split blocks of code
        opts = {
            use_default_keymaps = false,
            check_syntax_error = true,
            max_join_length = 120,
            cursor_behavior = "start", -- hold | start | end
            notify = true,
            dot_repeat = true,
            on_error = nil,
        },
        keys = {
            { "<leader>o", ":TSJToggle<CR>", desc = "Toggle join/split" },
        },
    },

    {
        "Wansmer/sibling-swap.nvim", -- Swap sibling treesitter nodes (e.g. move function argument to prev/next position, etc.)
        opts = {
            use_default_keymaps = false,
            highlight_node_at_cursor = false,
            ignore_injected_langs = false,
            allow_interline_swaps = true,
            interline_swaps_without_separator = false,
        },
        keys = {
            {
                "<leader><",
                ":lua require('sibling-swap').swap_with_left()<CR>",
                desc = "Move node back",
            },
            {
                "<leader>>",
                ":lua require('sibling-swap').swap_with_right()<CR>",
                desc = "Move node forward",
            },
        },
    },
}
