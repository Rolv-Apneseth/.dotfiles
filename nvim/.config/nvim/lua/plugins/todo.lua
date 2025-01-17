local icons = require("core.icons")

return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    opts = {
        signs = false, -- show icons in the signs column
        keywords = {
            TODO = { icon = "", color = "info" },
            HACK = { icon = "", color = "warning" },
            PERF = { icon = "󱫌", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
            TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
            NOTE = { icon = icons.diagnostics.Information, color = "hint", alt = { "INFO" } },
            IMPORTANT = { icon = "" },
            FIX = {
                icon = icons.diagnostics.Error,
                color = "error",
                alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
            },
            WARN = {
                icon = icons.diagnostics.Warning,
                color = "warning",
                alt = { "WARNING", "XXX" },
            },
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
        highlight = {
            multiline = true, -- enable multine todo comments
            before = "", -- "fg" or "bg" or empty
            keyword = "fg", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
            after = "fg", -- "fg" or "bg" or empty
            comments_only = true, -- uses treesitter to match keywords in comments only
            max_line_len = 400, -- ignore lines longer than this
            exclude = {}, -- list of file types to exclude highlighting
        },
        colors = {
            error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
            warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
            info = { "DiagnosticInfo", "#2563EB" },
            hint = { "DiagnosticHint", "#10B981" },
            default = { "Identifier", "#7C3AED" },
            test = { "Identifier", "#FF00FF" },
        },
        search = {
            command = "rg",
            args = {
                "--color=never",
                "--no-heading",
                "--with-filename",
                "--line-number",
                "--column",
            },
            pattern = [[\b(KEYWORDS):]], -- ripgrep regex
        },
    },
    keys = {
        {
            "<leader>;",
            ":TodoTelescope<CR>",
            desc = "Todo comments",
        },
    },
}
