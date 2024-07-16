local require_plugin = require("core.helpers").require_plugin
local keymaps = require("core.keymappings").whichkey
local icons = require("core.icons")

return {
    "folke/which-key.nvim", -- for showing shortcuts
    -- TODO: update keymaps to v3
    version = "2.1.0",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local which_key = require_plugin("which-key")
        if not which_key then
            return
        end

        which_key.setup({
            plugins = {
                marks = true, -- shows a list of your marks on ' and `
                registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
                spelling = {
                    -- Using telescope builtin spell_suggest
                    enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                    suggestions = 5, -- how many suggestions should be shown in the list?
                },
                -- the presets plugin, adds help for a bunch of default keybindings in Neovim
                -- No actual key bindings are created
                presets = {
                    operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                    motions = true, -- adds help for motions
                    text_objects = false, -- help for text objects triggered after entering an operator
                    windows = true, -- default bindings on <c-w>
                    nav = true, -- misc bindings to work with windows
                    z = true, -- bindings for folds, spelling and others prefixed with z
                    g = true, -- bindings for prefixed with g
                },
            },
            icons = {
                breadcrumb = icons.misc.Next, -- symbol used in the command line area that shows your active key combo
                separator = icons.ui.Next, -- symbol used between a key and it's label
                group = icons.misc.Plus, -- symbol prepended to a group
            },
            popup_mappings = {
                scroll_down = "<c-d>", -- binding to scroll down inside the popup
                scroll_up = "<c-u>", -- binding to scroll up inside the popup
            },
            window = {
                border = "rounded", -- none, single, double, shadow
                position = "bottom", -- bottom, top
                margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
                padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
                winblend = 0,
            },
            layout = {
                height = { min = 4, max = 25 }, -- min and max height of the columns
                width = { min = 20, max = 50 }, -- min and max width of the columns
                spacing = 1, -- spacing between columns
                align = "left", -- align columns left, center or right
            },
            ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
            hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
            show_help = true, -- show help message on the command line when the popup is visible
            triggers = "auto", -- automatically setup triggers
            -- triggers = {"<leader>"} -- or specify a list manually
            triggers_blacklist = {
                -- list of mode / prefixes that should never be hooked by WhichKey
                -- this is mostly relevant for key maps that start with a native binding
                -- most people should not need to change this
                i = { "j", "k" },
                v = { "j", "k" },
            },
        })

        -- KEYBINDINGS
        -- Options
        local function get_opts(prefix, mode)
            return {
                mode = mode,
                prefix = prefix,
                buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
                silent = true, -- use `silent` when creating keymaps
                noremap = true, -- use `noremap` when creating keymaps
                nowait = true, -- use `nowait` when creating keymaps
            }
        end

        local opts_leader_n = get_opts("<leader>", "n")
        local opts_leader_v = get_opts("<leader>", "v")

        -- Apply keymaps
        which_key.register(keymaps.leader_n, opts_leader_n)
        which_key.register(keymaps.leader_v, opts_leader_v)
        which_key.register(keymaps.leader_nv, opts_leader_n)
        which_key.register(keymaps.leader_nv, opts_leader_v)
    end,
}
