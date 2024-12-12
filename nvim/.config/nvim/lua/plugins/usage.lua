return {
    "ptdewey/pendulum-nvim", -- Stats on time spent on projects and files
    lazy = false,
    opts = {
        log_file = vim.fn.expand("$XDG_DATA_HOME/pendulum-log.csv"),
        top_n = 5,
        gen_reports = true, -- Requires Go installed
        report_section_excludes = {
            "branch",
        },
        report_excludes = {
            project = {
                "unknown_project", -- Exclude unknown (non-git) projects
            },
        },
    },
    -- Rebuild binary when installing/updating
    build = "<cmd>PendulumRebuild<cr>",
    keys = {
        { "<leader>O", "<cmd>Pendulum ''<cr>", desc = "Usage stats" },
    },
}
