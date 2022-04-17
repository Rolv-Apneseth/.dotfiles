local colorscheme = "onedarker"
local colorscheme_visual_multi = "purplegray"
local transparent_bg = true

-- Set colorscheme and notify user if colorscheme could not be found
local is_changed_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_changed_ok then
    vim.notify("The colorscheme " .. colorscheme .. " was not found.")
end

-- Set vim-visual-multi (plugin for multi-line cursors) theme
vim.api.nvim_set_var("VM_theme", colorscheme_visual_multi)

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
        vim.cmd("highlight " .. group .. " guibg=none ctermbg=none")
    end
end
