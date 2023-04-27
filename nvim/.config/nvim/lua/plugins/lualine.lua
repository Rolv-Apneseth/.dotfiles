local icons = require("core.icons")

return {
    "nvim-lualine/lualine.nvim", -- Statusbar
    dependencies = {
        "Rolv-Apneseth/onedark.nvim",
    },
    opts = {
        options = {
            theme = "onedark",
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
    },
}
