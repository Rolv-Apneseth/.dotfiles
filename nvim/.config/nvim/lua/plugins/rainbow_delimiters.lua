return {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
        -- This module contains a number of default definitions
        local rainbow_delimiters = require("rainbow-delimiters")

        vim.g.rainbow_delimiters = {
            strategy = {
                [""] = rainbow_delimiters.strategy["global"],
                vim = rainbow_delimiters.strategy["local"],
            },
            --[[ :h rb-delimiters-query ]]
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
                -- [[ issue with query groups for html + related languages, to be solved with https://github.com/neovim/neovim/pull/17099 ]]
                tsx = "rainbow-parens",
            },
            highlight = {
                "RainbowDelimiterCyan",
                "RainbowDelimiterViolet",
                "RainbowDelimiterOrange",
                "RainbowDelimiterBlue",
                "RainbowDelimiterYellow",
                "RainbowDelimiterGreen",
                "RainbowDelimiterRed",
            },
        }
    end,
}
