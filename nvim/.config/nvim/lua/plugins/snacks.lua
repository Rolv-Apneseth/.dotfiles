local get_random_header = require("core.headers").get_random_header
local icons = require("core.icons")

-- HACK: disable buggy animations in completion windows
local autocmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup("BlinkSnacksCompat", { clear = true })

autocmd("User", {
    group = group,
    pattern = "BlinkCmpMenuOpen",
    callback = function()
        vim.g.snacks_animate = false
    end,
})

autocmd("User", {
    group = group,
    pattern = "BlinkCmpMenuClose",
    callback = function()
        vim.g.snacks_animate = true
    end,
})

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
        input = {
            enabled = true,
            icon = " ",
            icon_hl = "SnacksInputIcon",
            icon_pos = "left",
            prompt_pos = "title",
            win = { style = "input" },
            expand = true,
        },

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
                        action = ":lua Snacks.picker.smart({hidden = true})",
                    },
                    {
                        icon = "󱨋",
                        key = "z",
                        desc = "Notes",
                        action = ":ZkNotes",
                    },
                    {
                        icon = "󰄲",
                        key = "t",
                        desc = "Todo",
                        action = ":cd $ZK_NOTEBOOK_DIR | e todo.md",
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

        -- IMAGES
        styles = {
            snacks_image = {
                relative = "editor",
                col = -1,
            },
        },
        image = {
            enabled = true,
            doc = {
                inline = true,
                only_render_image_at_cursor = true,
                float = true,
                max_width = 60,
            },
        },

        -- PICKER
        picker = {
            prompt = icons.ui.ChevronRight .. " ",
            sources = {},
            focus = "input",
            show_delay = 5000,
            limit_live = 10000,
            layout = {
                cycle = true,
                --- Use the default layout or vertical if the window is too narrow
                preset = function()
                    return vim.o.columns >= 120 and "default" or "vertical"
                end,
            },
            ---@class snacks.picker.matcher.Config
            matcher = {
                fuzzy = true, -- use fuzzy matching
                smartcase = true, -- use smartcase
                ignorecase = true, -- use ignorecase
                sort_empty = false, -- sort results when the search string is empty
                filename_bonus = true, -- give bonus for matching file names (last part of the path)
                file_pos = false, -- support patterns like `file:line:col` and `file:line`
                -- the bonusses below, possibly require string concatenation and path normalization,
                -- so this can have a performance impact for large lists and increase memory usage
                cwd_bonus = true, -- give bonus for matching files in the cwd
                frecency = true, -- frecency bonus
                history_bonus = true, -- give more weight to chronological order
            },
            sort = {
                -- default sort is by score, text length and index
                fields = { "score:desc", "#text", "idx" },
            },
            ui_select = true, -- replace `vim.ui.select` with the snacks picker
            ---@class snacks.picker.jump.Config
            jump = {
                jumplist = true, -- save the current position in the jumplist
                tagstack = false, -- save the current position in the tagstack
                reuse_win = false, -- reuse an existing window if the buffer is already open
                close = true, -- close the picker when jumping/editing to a location (defaults to true)
                match = false, -- jump to the first match position. (useful for `lines`)
            },
            toggles = {
                follow = "f",
                hidden = "h",
                ignored = "i",
                modified = "m",
                regex = { icon = "R", value = false },
            },
            win = {
                -- preview window
                preview = {
                    keys = {
                        ["<Esc>"] = "cancel",
                        ["q"] = "cancel",
                        ["i"] = "focus_input",
                        ["<a-w>"] = "cycle_win",
                    },
                },
            },
        },
    },

    keys = {
        {
            "<leader>n",
            ":lua Snacks.picker.notifications()<CR>",
            desc = "Notifications",
        },

        -- PICKER KEYBINDS
        {
            "<leader>f",
            ":lua Snacks.picker.smart({hidden = true})<CR>",
            desc = "Find file",
        },
        {
            "<leader>/",
            ":lua Snacks.picker.grep({cmd = 'rg', hidden = true})<CR>",
            desc = "Live grep",
        },
        {
            "<leader>u",
            ":lua Snacks.picker.undo()<CR>",
            desc = "Undo history",
        },
        {
            "<leader>b",
            ":lua Snacks.picker.buffers({ win = { input = { keys = { ['d'] = { 'bufdelete', mode = { 'n', 'i' } }}}}})<CR>",
            desc = "Buffers",
        },
    },
}
