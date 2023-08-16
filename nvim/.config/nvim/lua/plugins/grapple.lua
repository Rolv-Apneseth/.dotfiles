return {
    "cbochs/grapple.nvim",  -- Easier navigation between important files
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
            "<cmd>GrappleToggle<CR>",
            desc = "Grapple - toggle tag",
        },
        {
            "<leader>M",
            "<cmd>GrapplePopup tags<CR>",
            desc = "Grapple - view tags",
        },
        {
            "<leader>J",
            "<cmd>GrappleCycle backward<CR>",
            desc = "Grapple - previous tag",
        },
        {
            "<leader>K",
            "<cmd>GrappleCycle backward<CR>",
            desc = "Grapple - next tag",
        },
        {
            "<leader>1",
            "<cmd>GrappleSelect key=1<CR>",
            desc = "Grapple - 1",
        },
        {
            "<leader>2",
            "<cmd>GrappleSelect key=2<CR>",
            desc = "Grapple - 2",
        },
        {
            "<leader>3",
            "<cmd>GrappleSelect key=3<CR>",
            desc = "Grapple - 3",
        },
        {
            "<leader>4",
            "<cmd>GrappleSelect key=4<CR>",
            desc = "Grapple - 4",
        },
        {
            "<leader>5",
            "<cmd>GrappleSelect key=5<CR>",
            desc = "Grapple - 5",
        },
        {
            "<leader>6",
            "<cmd>GrappleSelect key=6<CR>",
            desc = "Grapple - 6",
        },
    },
}
