PLUGINS = {
    "Reledia/glow.yazi",
    "DreamMaoMao/keyjump.yazi",
    "Sonico98/exifaudio.yazi",
    "ndtoan96/ouch.yazi",
    "dedukun/bookmarks.yazi",
    "DreamMaoMao/fg.yazi",
    "Rolv-Apneseth/bypass.yazi",
    "Rolv-Apneseth/starship.yazi",
}
PLUGINS_DIR = "/home/rolv/.config/yazi/plugins/"
DELETE_OLD_PLUGINS = true

-- UTILS
local function build_repo_url(slug)
    return "https://github.com/" .. slug .. ".git"
end

local function split_slug(slug)
    local t = {}
    for str in string.gmatch(slug, "[^/]+") do
        table.insert(t, str)
    end
    return t
end

local function build_repo_path(name)
    return PLUGINS_DIR .. name .. "/"
end

local function repo_exists_locally(path)
    local ok, _err, code = os.rename(path, path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    return ok
end

-- INSTALL PLUGINS
local names = {}
for i, slug in ipairs(PLUGINS) do
    local url = build_repo_url(slug)
    local name = split_slug(slug)[2]
    local path = build_repo_path(name)
    names[i] = name

    if not repo_exists_locally(path) then
        os.execute("git clone " .. url .. " " .. path)
    end
end

-- REMOVE OLD PLUGINS
if DELETE_OLD_PLUGINS then
    local pfile = io.popen('ls "' .. PLUGINS_DIR .. '"')
    for filename in pfile:lines() do
        local found = false
        for i, name in ipairs(names) do
            if name == filename then
                found = true
                goto continue
                table.remove(names, i)
            end
        end
        ::continue::

        if not found then
            os.execute('rm -rf "' .. PLUGINS_DIR .. filename .. '"')
        end
    end
    pfile:close()
end

-- PLUGIN SETUP/CONFIG
require("starship"):setup()
require("bookmarks"):setup({
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
