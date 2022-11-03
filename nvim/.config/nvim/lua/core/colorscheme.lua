local M = {}

M.USE_TRANSPARENT_BG = true
M.THEME = "onedark"

-- Set colorscheme and notify user if colorscheme could not be found
local is_changed_ok, onedark = pcall(require, M.THEME)
if not is_changed_ok then
    vim.notify("The plugin onedark could not be found")
end

onedark.setup({
    style = "darker",
    transparent = M.USE_TRANSPARENT_BG,
})
onedark.load()

-- Set transparent backgrounds
if M.USE_TRANSPARENT_BG then
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
end

return M
