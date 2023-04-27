-- Pull in the wezterm API
local wezterm = require("wezterm")
local colours = require("colours")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

for k, v in pairs({
    colors = colours,
    font = wezterm.font("Inconsolata Nerd Font Mono"),
    font_size = 18,
    line_height = 1.0,
    window_background_opacity = 0.8,
    text_background_opacity = 1.0,
    window_padding = {
        left = 25,
        right = 25,
        top = 15,
        bottom = 15,
    },
    hide_tab_bar_if_only_one_tab = true,
    default_prog = { "/usr/bin/zsh" },
    window_close_confirmation = "NeverPrompt",
    enable_wayland = true,
    detect_password_input = false,
    keys = {
        {
            key = "r",
            mods = "CMD|SHIFT",
            action = wezterm.action.ReloadConfiguration,
        },
    },
}) do
    config[k] = v
end

return config
