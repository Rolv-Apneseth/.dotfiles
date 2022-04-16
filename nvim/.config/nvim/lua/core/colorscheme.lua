local colorscheme = "onedarker" -- Alternatives: slate, monokai
local transparent_bg = true

local is_status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- Set transparent backgrounds
if transparent_bg then
    local groups = {
        "Comment",
        "Conditional",
        "Constant",
        "CursorLineNr",
        "Folded",
        "Function",
        "Identifier",
        "LineNr",
        "MoreMsg",
        "MsgArea",
        "NonText",
        "Normal",
        "NormalNC",
        "NvimTreeNormal",
        "Operator",
        "PreProc",
        "Repeat",
        "SignColumn",
        "Special",
        "Statement",
        "String",
        "Structure",
        "Todo",
        "Type",
        "Underlined",
        "NormalFloat",
        "FloatBorder",
    }

    for _, group in ipairs(groups) do
        pcall(vim.cmd, "highlight " .. group .. " guibg=none ctermbg=none")
    end
    return
end

if not is_status_ok then
    vim.notify("The colorscheme " .. colorscheme .. " was not found.")
    return
end
