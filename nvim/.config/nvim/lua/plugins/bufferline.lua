local require_plugin = require("core.helpers").require_plugin
local theme = require("core.colorscheme").THEME

local bufferline = require_plugin("bufferline")
local bufdelete = require_plugin("bufdelete")
local theme_colours = require_plugin(theme .. ".colors")
if not bufferline or not theme_colours or not bufdelete then
    return
end

bufferline.setup({
    options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        close_command = bufdelete.bufdelete,
        right_mouse_command = bufdelete.bufdelete,
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        tab_size = 20,
        diagnostics = false, -- false | "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 2 } },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        --[[ buffer_close_icon = "", ]]
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = { "", "" },
        enforce_regular_tabs = true,
        always_show_bufferline = true,
        indicator = {
            style = "underline",
        },
    },
    highlights = {
        buffer_selected = {
            bold = true,
            italic = true,
        },
        tab = { fg = theme_colours.blue },
        buffer_visible = { fg = theme_colours.blue },
    },
})
