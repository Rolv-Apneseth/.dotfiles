return {
    "3rd/time-tracker.nvim", -- Tracks time in files/projects
    dependencies = {
        "3rd/sqlite.nvim",
    },
    event = "VeryLazy",
    opts = {
        data_file = vim.fn.stdpath("data") .. "/time-tracker.db",
    },
    keys = {
        {
            "<leader>O",
            ":TimeTracker<CR>",
            desc = "Usage stats",
        },
    },
}
