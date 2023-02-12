local keymaps = require("core.keymappings").surround

return {
    "kylechui/nvim-surround", -- for surrounding text with quotes, parentheses etc.
    opts = {
        keymaps = keymaps,
        highlight = {
            duration = 1,
        },
    },
}
