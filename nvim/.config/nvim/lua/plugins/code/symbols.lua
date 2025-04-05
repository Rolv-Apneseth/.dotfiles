return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<leader>E", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
        outline_window = {
            auto_jump = true,
            show_cursorline = true,
            hide_cursor = true,
        },
        outline_items = {
            show_symbol_lineno = false,
        },
        symbol_folding = {
            autofold_depth = 1,
            auto_unfold = {
                hovered = true,
            },
        },
        keymaps = {
            show_help = "?",
            close = { "<Esc>", "q" },
            goto_location = "<S-CR>",
            goto_and_close = "<CR>",
            toggle_preview = "<Space>",
            hover_symbol = "K",
            rename_symbol = "r",
            code_actions = "a",
            -- These fold actions are collapsing tree nodes, not code folding
            fold = "h",
            unfold = "l",
            fold_toggle = "<Tab>",
            -- Toggle folds for all nodes.
            -- If at least one node is folded, this action will fold all nodes.
            -- If all nodes are folded, this action will unfold all nodes.
            fold_toggle_all = "<S-Tab>",
            fold_all = "W",
            unfold_all = "E",
            fold_reset = "R",
            -- Move down/up by one line and peek_location immediately.
            down_and_jump = "<C-j>",
            up_and_jump = "<C-k>",
        },
    },
}
