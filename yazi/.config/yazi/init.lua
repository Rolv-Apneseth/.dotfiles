-- PLUGIN SETUP/CONFIG
--- Require plugin, giving a warning notification if a plugin is not found
--- @param plugin_name string
---@return nil|any
local function require_plugin(plugin_name)
    local status_ok, plugin = pcall(require, plugin_name)

    if not status_ok then
        ya.notify({
            title = "Plugins",
            content = "Could not find plugin: " .. plugin_name,
            timeout = 5,
        })
        return nil
    end

    return plugin
end

local starship = require_plugin("starship")
if starship then
    starship:setup()
end

local bookmarks = require_plugin("bookmarks")
if bookmarks then
    bookmarks:setup({
        notify = {
            enable = true,
            timeout = 1,
            message = {
                new = " Created bookmark '<key>'",
                delete = "󰧌 Deleted bookmark '<key>'",
                delete_all = "󰧌 Deleted all bookmarks",
            },
        },
    })
end

-- OVERRIDE DEFAULT UI
-- Give some extra space for footer and header + cool columns
function Manager:render(area)
    local chunks = self:layout(area)

    local bar = function(c, x, y)
        x, y = math.max(0, x), math.max(0, y)
        return ui.Bar(
            ui.Rect({
                x = x,
                y = y,
                w = ya.clamp(0, area.w - x, 1),
                h = math.min(1, area.h),
            }),
            ui.Bar.TOP
        ):symbol(c)
    end

    return ya.flat({
        -- Borders
        ui.Bar(chunks[1], ui.Bar.RIGHT)
            :symbol(THEME.manager.border_symbol)
            :style(THEME.manager.border_style),
        ui.Bar(chunks[3], ui.Bar.LEFT)
            :symbol(THEME.manager.border_symbol)
            :style(THEME.manager.border_style),

        bar("┬", chunks[1].right - 1, chunks[1].y),
        bar("┴", chunks[1].right - 1, chunks[1].bottom - 1),
        bar("┬", chunks[2].right, chunks[2].y),
        bar("┴", chunks[2].right, chunks[1].bottom - 1),

        -- Parent
        Parent:render(chunks[1]:padding(ui.Padding.xy(1))),
        -- Current
        Current:render(chunks[2]:padding(ui.Padding.y(1))),
        -- Preview
        Preview:render(chunks[3]:padding(ui.Padding.xy(1))),
    })
end
