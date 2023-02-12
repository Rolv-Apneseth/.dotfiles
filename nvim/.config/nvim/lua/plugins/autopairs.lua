local keymappings = require("core.keymappings").treesitter.autopairs.fastwrap
local require_plugin = require("core.helpers").require_plugin

return {
    "windwp/nvim-autopairs", -- auto pair brackets, quotations etc.
    config = function()
        local npairs = require_plugin("nvim-autopairs")
        if not npairs then
            return
        end

        npairs.setup({
            check_ts = true,
            ts_opts = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = keymappings,
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertyuiopzxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        })

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end
        cmp.event:on(
            "confirm_done",
            cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
        )
    end,
}
