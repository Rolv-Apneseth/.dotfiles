local require_plugin = require("core.helpers").require_plugin

local nvim_navic = require_plugin("nvim-navic")
if not nvim_navic then
    return
end

--[[ nvim_navic.setup({ ]]
--[[     icons = { ]]
--[[         File = " ", ]]
--[[         Module = " ", ]]
--[[         Namespace = " ", ]]
--[[         Package = " ", ]]
--[[         Class = " ", ]]
--[[         Method = " ", ]]
--[[         Property = " ", ]]
--[[         Field = " ", ]]
--[[         Constructor = " ", ]]
--[[         Enum = "練", ]]
--[[         Interface = "練", ]]
--[[         Function = " ", ]]
--[[         Variable = " ", ]]
--[[         Constant = " ", ]]
--[[         String = " ", ]]
--[[         Number = " ", ]]
--[[         Boolean = "◩ ", ]]
--[[         Array = " ", ]]
--[[         Object = " ", ]]
--[[         Key = " ", ]]
--[[         Null = "ﳠ ", ]]
--[[         EnumMember = " ", ]]
--[[         Struct = " ", ]]
--[[         Event = " ", ]]
--[[         Operator = " ", ]]
--[[         TypeParameter = " ", ]]
--[[     }, ]]
--[[     highlight = false, ]]
--[[     separator = " > ", ]]
--[[     depth_limit = 0, ]]
--[[     depth_limit_indicator = "..", ]]
--[[ }) ]]

vim.g.navic_silence = false -- fail silently
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Servers to not attach navic for
return {
    "cssls",
}
