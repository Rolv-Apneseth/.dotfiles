local icons = require("core.constants").ICONS
local require_plugin = require("core.helpers").require_plugin

local notify = require_plugin("notify")
if not notify then
    return
end

local messages_to_be_filtered = {
    "character_offset must be called",
    "method textDocument",
}

notify.setup({
    -- Animation style (see below for details)
    stages = "fade", -- fade_in_slide_out fade slide static

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 500,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    background_colour = "#000000",

    -- Minimum width for notification windows
    minimum_width = 10,

    -- Icons for the different levels
    icons = {
        ERROR = icons.diagnostics.Error,
        WARN = icons.diagnostics.Warning,
        INFO = icons.diagnostics.Information,
        DEBUG = icons.ui.Bug,
        TRACE = icons.ui.Pencil,
    },
})

local filtered_notify = function(msg, ...)
    for _, value in pairs(messages_to_be_filtered) do
        if value == msg then
            return
        end
    end

    notify(msg, ...)
end

vim.notify = filtered_notify
