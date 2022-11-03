local require_plugin = require("core.helpers").require_plugin

local inc_rename = require_plugin("inc_rename")
local dressing = require_plugin("dressing")
if not inc_rename or not dressing then
    return
end

inc_rename.setup({
    cmd_name = "IncRename", -- the name of the command
    hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
    preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
    show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
    input_buffer_type = "dressing", -- the type of the external input buffer to use (the only supported value is currently "dressing")
    post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
})

-- Set here as it requires this plugin anyways and is a lua function, but a label is provided for which-key
vim.keymap.set("n", "<leader>R", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
