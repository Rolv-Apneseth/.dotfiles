local require_plugin = require("core.helpers").require_plugin

local nvim_navic = require_plugin("nvim-navic")
if not nvim_navic then
    return
end

vim.g.navic_silence = false -- fail silently
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- Servers to not attach navic for
return {
    "cssls",
}
