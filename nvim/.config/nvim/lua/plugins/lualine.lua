local require_plugin = require("core.helpers").require_plugin
local icons = require("core.constants").ICONS
local theme = require("core.colorscheme").THEME

local lualine = require_plugin("lualine")
local navic = require_plugin("nvim-navic")
if not lualine or not navic then
    return
end

lualine.setup({
    options = {
        theme = theme,
        component_separators = "|",
        section_separators = {
            left = icons.ui.HalfCircleRight,
            right = icons.ui.HalfCircleLeft,
        },
    },
    sections = {
        lualine_a = {
            {
                "mode",
                separator = { left = icons.ui.HalfCircleLeft },
                right_padding = 2,
            },
        },
        lualine_b = {
            "filetype",
        },
        --[[ lualine_b = { "filesize", "filename", "branch" }, ]]
        lualine_c = {},
        lualine_x = {},
        lualine_y = {
            {
                "diagnostics",
                sources = { "nvim_diagnostic" },
                symbols = {
                    error = icons.diagnostics.Error .. " ",
                    warn = icons.diagnostics.Warning .. " ",
                    info = icons.diagnostics.Information .. " ",
                },
                --[[ diagnostics_color = { ]]
                --[[     color_error = { fg = colors.red }, ]]
                --[[     color_warn = { fg = colors.yellow }, ]]
                --[[     color_info = { fg = colors.blue }, ]]
                --[[ }, ]]
            },
            "filesize",
        },
        lualine_z = {
            {
                "location",
                separator = { right = icons.ui.HalfCircleRight },
                left_padding = 2,
            },
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
