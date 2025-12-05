return {
    "saghen/blink.cmp", -- Completions (with fuzzy matching)
    dependencies = {
        -- SNIPPETS
        "rafamadriz/friendly-snippets",
        -- OTHER SOURCES
        "bydlw98/blink-cmp-env",
        -- EXTRAS
        "xzbdmw/colorful-menu.nvim",
    },
    event = "InsertEnter",
    version = "1.*",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = "enter",

            ["<Esc>"] = {},

            ["<Up>"] = { "snippet_backward", "select_prev", "fallback" },
            ["<Down>"] = { "snippet_forward", "select_next", "fallback" },

            -- show with only snippets providers
            ["<C-space>"] = {
                function(cmp)
                    cmp.show({ providers = { "snippets" } })
                end,
            },
        },

        appearance = {
            nerd_font_variant = "mono",
        },

        completion = {
            trigger = {
                -- "Shows after typing a keyword, typically an alphanumeric character, - or _"
                show_on_keyword = true,
            },
            documentation = { auto_show = true, window = { border = "rounded" } },
            menu = {
                border = "rounded",
                -- Use `colorful-menu` for better syntax highlighting / colours
                draw = {
                    -- label and label_description are combined together in label by colorful-menu.nvim.
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        },
                    },
                },
            },
            list = {
                max_items = 100,
                selection = {
                    preselect = false,
                    auto_insert = false,
                },
            },
        },

        cmdline = {
            keymap = {
                preset = "enter",
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
            },
            completion = {
                menu = {
                    -- Auto-show for commands but not other inputs
                    auto_show = function(_)
                        return vim.fn.getcmdtype() == ":"
                    end,
                },
                ghost_text = { enabled = true },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = false,
                    },
                },
            },
        },

        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer", "env" },

            providers = {
                path = {
                    opts = {
                        show_hidden_files_by_default = true,
                    },
                },
                buffer = {
                    score_offset = -5,
                },

                -- Additional sources
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
                env = {
                    name = "Env",
                    module = "blink-cmp-env",
                    score_offset = -5,
                    opts = {
                        show_documentation_window = true,
                    },
                },
            },
        },

        fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
}
