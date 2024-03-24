PLUGINS = {
    "Reledia/glow.yazi",
    "DreamMaoMao/keyjump.yazi",
    "Sonico98/exifaudio.yazi",
    "ndtoan96/ouch.yazi",
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

-- SETUP/CONFIG
require("starship"):setup()
