return {
    "cbochs/grapple.nvim", -- Easier navigation between important files
    opts = {
        log_level = "warn", -- "debug" | "info" | "warn" | "error"
        scope = "git",
        popup_options = {
            relative = "editor",
            width = 60,
            height = 12,
            style = "minimal",
            focusable = false,
            border = "single",
        },
    },
    keys = {
        {
            "<leader>m",
            "<cmd>Grapple toggle<CR>",
            desc = "Grapple - toggle tag",
        },
        {
            "<leader>M",
            "<cmd>Grapple open_tags<CR>",
            desc = "Grapple - view tags",
        },
        {
            "<leader>1",
            "<cmd>Grapple select index=1<CR>",
            desc = "Grapple - 1",
        },
        {
            "<leader>2",
            "<cmd>Grapple select index=2<CR>",
            desc = "Grapple - 2",
        },
        {
            "<leader>3",
            "<cmd>Grapple select index=3<CR>",
            desc = "Grapple - 3",
        },
        {
            "<leader>4",
            "<cmd>Grapple select index=4<CR>",
            desc = "Grapple - 4",
        },
        {
            "<leader>5",
            "<cmd>Grapple select index=5<CR>",
            desc = "Grapple - 5",
        },
        {
            "<leader>6",
            "<cmd>Grapple select index=6<CR>",
            desc = "Grapple - 6",
        },
        {
            "<leader>7",
            "<cmd>Grapple select index=7<CR>",
            desc = "Grapple - 7",
        },
        {
            "<leader>8",
            "<cmd>Grapple select index=8<CR>",
            desc = "Grapple - 8",
        },
    },
}
