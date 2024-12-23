local require_plugin = require("core.helpers").require_plugin

return {
    "ggandor/leap.nvim", -- for easier navigation around a file

    config = function()
        local leap = require_plugin("leap")
        if not leap then
            return
        end

        leap.opts.special_keys.prev_target = "<s-enter>"
        leap.opts.highlight_unlabeled_phase_one_targets = true
    end,

    keys = {
        {
            "S",
            function()
                require("leap").leap({ target_windows = { vim.fn.win_getid() } })
            end,
            desc = "Todo comments",
        },
    },
}
