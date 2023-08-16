local constants = require("core.constants")

return {
    "m4xshen/smartcolumn.nvim",
    opts = {
        colorcolumn = constants.LINE_LENGTH,
        disabled_filetypes = { "NvimTree", "lazy", "mason", "help", "alpha" },
        scope = "line",
    },
}
