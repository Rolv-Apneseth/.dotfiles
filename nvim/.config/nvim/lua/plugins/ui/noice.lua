local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    config = function()
        local noice = require_plugin("noice")
        local util = require_plugin("noice.util")
        if not noice or not util then
            return
        end

        noice.setup({
            routes = {
                {
                    view = "notify",
                    filter = { event = "msg_showmode" },
                },
                {
                    filter = {
                        -- Clean up some of the noise
                        any = {
                            -- Skip notification for saving file
                            {
                                event = "msg_show",
                                kind = "",
                                find = "written",
                            },
                            -- Skip notifications shown when undoing / redoing
                            {
                                event = "msg_show",
                                kind = "",
                                find = "change",
                            },
                            {
                                event = "msg_show",
                                kind = "",
                                find = "fewer lines",
                            },
                            {
                                event = "msg_show",
                                kind = "",
                                find = "less line",
                            },
                            {
                                event = "msg_show",
                                kind = "",
                                find = "more line",
                            },
                            {
                                event = "msg_show",
                                find = "search hit",
                            },
                            {
                                event = "msg_show",
                                find = "Pattern not found",
                            },
                        },
                    },
                    opts = { skip = true },
                },
            },
            cmdline = {
                enabled = true, -- enables the Noice cmdline UI
                view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
                format = {
                    cmdline = {
                        pattern = "^:",
                        icon = icons.ui.ChevronRight,
                        lang = "vim",
                    },
                    search_down = {
                        kind = "search",
                        pattern = "^/",
                        icon = icons.ui.Search .. " ",
                        lang = "regex",
                    },
                    search_up = {
                        kind = "search",
                        pattern = "^%?",
                        icon = icons.ui.Search .. " ",
                        lang = "regex",
                    },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    -- lua = false, -- to disable a format, set to `false`
                    lua = {
                        pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" },
                        icon = "",
                        lang = "lua",
                    },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "󰋖" },
                    input = {
                        icon = icons.ui.ChevronRight,
                    }, -- Used by input()
                },
            },
            messages = {
                enabled = true, -- enables the Noice messages UI
                view = "notify", -- default view for messages
                view_error = "notify", -- view for errors
                view_warn = "notify", -- view for warnings
                view_history = "messages", -- view for :messages
                view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
                opts = {
                    replace = true,
                },
            },
            popupmenu = {
                enabled = true, -- enables the Noice popupmenu UI
                backend = "nui", -- backend to use to show regular cmdline completions
                kind_icons = {}, -- set to `false` to disable icons
            },
            redirect = {
                view = "popup",
                filter = { event = "msg_show" },
            },
            commands = {
                history = {
                    view = "split",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                },
                last = {
                    view = "popup",
                    opts = { enter = true, format = "details" },
                    filter = {
                        any = {
                            { event = "notify" },
                            { error = true },
                            { warning = true },
                            { event = "msg_show", kind = { "" } },
                            { event = "lsp", kind = "message" },
                        },
                    },
                    filter_opts = { count = 1 },
                },
                errors = {
                    -- options for the message history that you get with `:Noice`
                    view = "popup",
                    opts = {
                        enter = true,
                        format = "details",
                    },
                    filter = { error = true },
                    filter_opts = { reverse = true },
                },
            },
            notify = {
                enabled = true,
                view = "notify",
            },
            lsp = {
                progress = { enabled = false },
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                    -- override the lsp markdown formatter with Noice
                    ["vim.lsp.util.stylize_markdown"] = false,
                    -- override cmp documentation with Noice (needs the other options + `hrsh7th/nvim-cmp` to work)
                    ["cmp.entry.get_documentation"] = false,
                },
                hover = {
                    enabled = false,
                    silent = false, -- set to true to not show a message if hover is not available
                    view = nil, -- when nil, use defaults from documentation
                    opts = {}, -- merged with defaults from documentation
                },
                signature = { enabled = true },
                message = {
                    -- Messages shown by lsp servers
                    enabled = false,
                    view = "notify",
                    opts = {},
                },
                -- defaults for hover and signature help
                documentation = {
                    view = "hover",
                    opts = {
                        lang = "markdown",
                        replace = true,
                        render = "plain",
                        format = { "{message}" },
                        win_options = { concealcursor = "n", conceallevel = 2 },
                    },
                },
            },
            markdown = {
                hover = {
                    ["|(%S-)|"] = vim.cmd.help, -- vim help links
                    ["%[.-%]%((%S-)%)"] = util.open, -- markdown links
                },
                highlights = {
                    ["|%S-|"] = "@text.reference",
                    ["@%S+"] = "@parameter",
                    ["^%s*(Parameters:)"] = "@text.title",
                    ["^%s*(Return:)"] = "@text.title",
                    ["^%s*(See also:)"] = "@text.title",
                    ["{%S-}"] = "@parameter",
                },
            },
            health = {
                checker = true, -- Disable if you don't want health checks to run
            },
            smart_move = {
                -- noice tries to move out of the way of existing floating windows.
                enabled = true, -- you can disable this behaviour here
                -- add any filetypes here, that shouldn't trigger smart move.
                excluded_filetypes = { "cmp_menu", "cmp_docs", "notify" },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = false, -- long messages will be sent to a split
                inc_rename = true, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
            throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
        })
    end,
    requires = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
        "hrsh7th/nvim-cmp",
    },
}
