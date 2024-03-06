PLUGINS = {
    "Reledia/glow.yazi",
    "dedukun/relative-motions.yazi",
    "Sonico98/exifaudio.yazi",
}

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
    return "~/.config/yazi/plugins/" .. name .. "/"
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
for i, slug in ipairs(PLUGINS) do
    print(slug)
    local url = build_repo_url(slug)
    local name = split_slug(slug)[2]
    local path = build_repo_path(name)

    if repo_exists_locally(path) then
        os.execute("pushd " .. path .. " && git pull && popd")
    else
        os.execute("git clone " .. url .. " " .. path)
    end
end

-- CONFIG
require("relative-motions"):setup({ show_numbers = "none", show_motion = true })
