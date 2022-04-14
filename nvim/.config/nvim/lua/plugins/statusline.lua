local status_ok, statusline = pcall(require, "lualine")
if not status_ok then
    return
end
local colors = {
    blue = "#80a0ff",
    black = "#08080800",
    white = "#f2f2f2",
    red = "#ff5189",
    violet = "#c678dd",
    darker_violet = "#a050b0",
    grey = "#303030",
    yellow = "#ecbe7b",
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.white, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.black, bg = colors.black },
    },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

statusline.setup({
    options = {
        theme = bubbles_theme,
        component_separators = "|",
        section_separators = { left = "", right = "" },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filesize", "filename", "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            "filetype",
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = { error = " ", warn = " ", info = " " },
                diagnostics_color = {
                    color_error = { fg = colors.red },
                    color_warn = { fg = colors.yellow },
                    color_info = { fg = colors.blue },
                },
            },
        },
        lualine_z = {
            { "location", separator = { right = "" }, left_padding = 2 },
        },
    },
    inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
})
