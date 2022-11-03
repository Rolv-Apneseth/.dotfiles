local keymaps = require("core.constants").OTHER_KEYMAPPINGS.surround
local require_plugin = require("core.helpers").require_plugin

local surround = require_plugin("nvim-surround")
if not surround then
    return
end

surround.setup({
    keymaps = keymaps,
    highlight = {
        duration = 1,
    },
})
