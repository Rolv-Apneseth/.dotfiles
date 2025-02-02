local get_random_header = require("core.headers").get_random_header

return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,

    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- WARN: add global `dd(...)` for quick debugging, and override `vim.print`
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                vim.print = _G.dd
            end,
        })
    end,

    ---@type snacks.Config
    opts = {
        -- Deal with large files, e.g. prevent LSP and treesitter from running, etc.
        bigfile = {
            notify = true,
            size = 2 * 1024 * 1024, -- 2MB
        },

        -- Delete buffers without disrupting window layout
        bufdelete = { enabled = false },

        -- Debug utils
        debug = { enabled = true },

        -- Git utils (including blame line - used in `keymappings.lua`)
        git = { enabled = true },
        -- Open the current file, branch, commit, or repo in a browser (e.g. GitHub, GitLab, Bitbucket)
        gitbrowse = { enabled = true },

        -- Better `vim.ui.input`
        input = { enabled = false },

        -- Integration for `lazygit`
        lazygit = {
            -- Automatically configure `lazygit` to use the current colorscheme
            -- and integrate edit with the current neovim instance
            configure = true,
        },

        -- Pretty `vim.notify`
        notifier = {
            width = { min = 40, max = 0.4 },
            height = { min = 1, max = 0.6 },
            sort = { "level", "added" },
            level = vim.log.levels.DEBUG,
        },

        -- Smooth scrolling
        scroll = {
            enabled = true,
            animate = {
                duration = { step = 15, total = 120 },
                easing = "linear",
            },
        },

        -- INDENT GUIDES -------------------------------------------------------------------
        indent = {
            indent = {
                enabled = true,
                char = "│",
                only_scope = false, -- only show indent guides of the scope
                only_current = true, -- only show indent guides in the current window
                hl = "Comment",
            },
            animate = {
                enabled = true,
                style = "out",
                easing = "linear",
                duration = {
                    step = 20, -- ms per step
                    total = 120, -- maximum duration
                },
            },
            scope = {
                enabled = true,
                underline = false, -- underline the start of the scope
                only_current = false, -- only show scope in the current window
                hl = "Label",
            },
        },

        -- DASHBOARD -----------------------------------------------------------------------
        dashboard = {
            enabled = true,
            preset = {
                header = get_random_header(),
                ---@type snacks.dashboard.Item[]
                keys = {
                    {
                        icon = "󰷈",
                        key = "e",
                        desc = "Edit current directory",
                        action = ":e .",
                    },
                    {
                        icon = "󰈞",
                        key = "f",
                        desc = "Find file",
                        action = ":Telescope find_files",
                    },
                    {
                        icon = "󰚸",
                        key = "r",
                        desc = "Recent files",
                        action = ":lua require('telescope').extensions.recent_files.pick()",
                    },
                    {
                        icon = "󱨋",
                        key = "z",
                        desc = "Notes",
                        action = ":ZkNotes",
                    },
                    {
                        icon = "",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    {
                        icon = "",
                        key = "c",
                        desc = "Config",
                        action = ":cd $HOME/.config/nvim | e .",
                    },
                    {
                        icon = "",
                        key = "g",
                        desc = "Browse repo",
                        action = function()
                            Snacks.gitbrowse()
                        end,
                    },
                    -- SUPPORTS `persistence.nvim`
                    {
                        icon = "󰁯",
                        key = "'",
                        desc = "Restore Session",
                        section = "session",
                    },
                    { icon = "󰈆", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            formats = {
                icon = function(item)
                    if item.file and item.icon == "file" or item.icon == "directory" then
                        return M.icon(item.file, item.icon)
                    end
                    return { item.icon, width = 2, hl = "icon" }
                end,
                footer = { "%s", align = "center" },
                header = { "%s", align = "center" },
                file = function(item, ctx)
                    local fname = vim.fn.fnamemodify(item.file, ":~")
                    fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
                    if #fname > ctx.width then
                        local dir = vim.fn.fnamemodify(fname, ":h")
                        local file = vim.fn.fnamemodify(fname, ":t")
                        if dir and file then
                            file = file:sub(-(ctx.width - #dir - 2))
                            fname = dir .. "/…" .. file
                        end
                    end
                    local dir, file = fname:match("^(.*)/(.+)$")
                    return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } }
                        or { { fname, hl = "file" } }
                end,
            },
            sections = {
                { section = "header" },
                function()
                    return {
                        file = vim.uv.cwd(),
                        padding = 1,
                        gap = 1,
                        align = "center",
                        colors = { f },
                    }
                end,
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
    },

    keys = {
        {
            "<leader>n",
            ":lua require 'snacks.notifier'.show_history()<CR>",
            desc = "Notification history",
        },
    },
}
