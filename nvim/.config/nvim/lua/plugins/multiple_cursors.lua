return {
    "brenton-leighton/multiple-cursors.nvim", -- Multiple cursors
    version = "*", -- Use the latest tagged version
    opts = {},
    keys = {
        {
            "<C-j>",
            "<Cmd>MultipleCursorsAddDown<CR>",
            mode = { "n", "x" },
            desc = "Add cursor and move down",
        },

        {
            "<C-Up>",
            "<Cmd>MultipleCursorsAddUp<CR>",
            mode = { "n", "i", "x" },
            desc = "Add cursor and move up",
        },
        {
            "<C-Down>",
            "<Cmd>MultipleCursorsAddDown<CR>",
            mode = { "n", "i", "x" },
            desc = "Add cursor and move down",
        },

        {
            "<C-LeftMouse>",
            "<Cmd>MultipleCursorsMouseAddDelete<CR>",
            mode = { "n", "i" },
            desc = "Add or remove cursor",
        },

        {
            "<Leader>a",
            "<Cmd>MultipleCursorsAddMatches<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to cword",
        },
        {
            "<Leader>A",
            "<Cmd>MultipleCursorsAddMatchesV<CR>",
            mode = { "n", "x" },
            desc = "Add cursors to cword in previous area",
        },

        --[[ { ]]
        --[[     "<Leader>l", ]]
        --[[     "<Cmd>MultipleCursorsLock<CR>", ]]
        --[[     mode = { "n", "x" }, ]]
        --[[     desc = "Lock virtual cursors", ]]
        --[[ }, ]]
    },
}
