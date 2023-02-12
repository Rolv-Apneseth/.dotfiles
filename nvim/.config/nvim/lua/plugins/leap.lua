local require_plugin = require("core.helpers").require_plugin

return {
    "ggandor/leap.nvim", -- for easier navigation around a file
    config = function()
        local leap = require_plugin("leap")
        if not leap then
            return
        end

        leap.add_default_mappings()

        -- Further styling set in theme, with groups LeapBackDrop and LeapMatch
        require("leap").opts.highlight_unlabeled_phase_one_targets = true
    end,
}
