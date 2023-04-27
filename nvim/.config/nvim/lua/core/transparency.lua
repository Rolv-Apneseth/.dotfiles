-- Force transparent backgrounds
return {
    -- used in theme config
    IS_FORCING_TRANSPARENCY = true,
    force_transparency = function()
        local groups = {
            "EndOfBuffer",
            "FloatBorder",
            "Folded",
            "Function",
            "Identifier",
            "MoreMsg",
            "MsgArea",
            "NonText",
            "Normal",
            "NormalFloat",
            "NormalNC",
            "NvimTreeNormal",
            "Operator",
            "PreProc",
            "Repeat",
            "SignColumn",
            "Special",
            "Statement",
            "StatusLine",
            "String",
            "Structure",
            "TabLine",
            "Todo",
            "Type",
            "Underlined",
        }

        for _, group in ipairs(groups) do
            vim.api.nvim_set_hl(0, group, { bg = "none" })
        end
    end,
}
