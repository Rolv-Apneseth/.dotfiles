local require_plugin = require("core.helpers").require_plugin

local indent_blankline = require_plugin("indent_blankline")
if not indent_blankline then
    return
end

-- Context indent highlighted by treesitter
indent_blankline.setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { "alpha" },
})
