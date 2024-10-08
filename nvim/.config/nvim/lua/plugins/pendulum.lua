return {
    "ptdewey/pendulum-nvim", -- Stats on time spent on projects and files
    lazy = false,
    opts = {
        log_file = vim.fn.expand("$XDG_DATA_HOME/pendulum-log.csv"),
        top_n = 5,
        gen_reports = true, -- Requires Go installed
    },
    -- Rebuild binary when installing/updating
    build = "<cmd>PendulumRebuild<cr>",
    keys = {
        { "<leader>O", "<cmd>Pendulum<cr>", desc = "Usage stats" },
    },
}
