local require_plugin = require("core.helpers").require_plugin
local transparency = require("core.transparency")

return {
    "Rolv-Apneseth/onedark.nvim", -- colourscheme
    --[[ dev = true, ]]
    config = function()
        local onedark = require_plugin("onedark")
        if not onedark then
            return
        end

        onedark.setup({
            style = "darker",
            transparent = transparency.IS_FORCING_TRANSPARENCY,
            diagnostics = {
                background = not transparency.IS_FORCING_TRANSPARENCY,
            },
        })
        onedark.load()

        if transparency.IS_FORCING_TRANSPARENCY then
            transparency.force_transparency()
        end
    end,
}
