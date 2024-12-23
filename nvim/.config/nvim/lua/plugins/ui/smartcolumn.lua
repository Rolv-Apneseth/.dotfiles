local constants = require("core.constants")

return {
    "m4xshen/smartcolumn.nvim", -- Hide colorcolumn unless on line that exceeds the max line length
    opts = {
        colorcolumn = constants.LINE_LENGTH,
        disabled_filetypes = { "NvimTree", "lazy", "mason", "help", "alpha", "snacks_dashboard" },
        scope = "line",
    },
}
