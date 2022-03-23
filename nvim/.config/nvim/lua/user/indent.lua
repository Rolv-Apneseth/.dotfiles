local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
    return
end

-- Context indent highlighted by treesitter
require("indent_blankline").setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
})
