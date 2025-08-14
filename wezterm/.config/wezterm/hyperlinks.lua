local wezterm = require("wezterm")

local function is_shell(foreground_process_name)
    local shell_names = { "bash", "zsh", "fish", "sh", "ksh", "dash" }
    local process = string.match(foreground_process_name, "[^/\\]+$") or foreground_process_name
    for _, shell in ipairs(shell_names) do
        if process == shell then
            return true
        end
    end
    return false
end

wezterm.on("open-uri", function(window, pane, uri)
    local editor = os.getenv("EDITOR")
    if not editor then
        editor = "nvim"
    end

    if uri:find("^file:") == 1 and not pane:is_alt_screen_active() then
        -- We're processing an hyperlink and the uri format should be: file://[HOSTNAME]/PATH[#linenr]
        -- Also the pane is not in an alternate screen (an editor, less, etc)
        local url = wezterm.url.parse(uri)
        if is_shell(pane:get_foreground_process_name()) then
            local success, mimetype, _ = wezterm.run_child_process({
                "file",
                "--brief",
                "--mime-type",
                url.file_path,
            })

            if not success then
                return
            end

            if mimetype:find("directory") then
                pane:send_text(wezterm.shell_join_args({ "cd", url.file_path }) .. "\r")
                return false
            end

            if mimetype:find("text") then
                if url.fragment then
                    pane:send_text(wezterm.shell_join_args({
                        editor,
                        "+" .. url.fragment,
                        url.file_path,
                    }) .. "\r")
                else
                    pane:send_text(wezterm.shell_join_args({ editor, url.file_path }) .. "\r")
                end
                return false
            end
        else
            -- No shell detected, probably connected with SSH so use fallback command
            local edit_cmd = url.fragment and editor .. " +" .. url.fragment .. ' "$_f"'
                or editor .. ' "$_f"'
            local cmd = '_f="'
                .. url.file_path
                .. '"; { test -d "$_f" && { cd "$_f" ; }; } '
                .. '|| { test "$(file --brief --mime-type "$_f" | cut -d/ -f1 || true)" = "text" && '
                .. edit_cmd
                .. "; }; echo"
            pane:send_text(cmd .. "\r")
            return false
        end
    end
end)
