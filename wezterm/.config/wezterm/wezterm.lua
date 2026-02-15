-- Pull in the wezterm API
local wezterm = require("wezterm")
local colours = require("colours")

-- Setup custom hyperlink functionality
require("hyperlinks")

local config = {}
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- OPTIONS -----------------------------------------------------------------------------------------
for k, v in pairs({
    colors = colours,
    animation_fps = 244,
    max_fps = 244,
    font = wezterm.font_with_fallback({
        "Inconsolata Nerd Font Mono",
        "Noto Color Emoji",
        --[[ "RobotoMono Nerd Font Mono", ]]
    }),
    font_size = 18,
    line_height = 1.0,
    window_background_opacity = 0.8,
    text_background_opacity = 1.0,
    underline_position = -4,
    window_padding = {
        left = 25,
        right = 25,
        top = 15,
        bottom = 15,
    },
    hide_tab_bar_if_only_one_tab = true,
    default_prog = { "zsh" },
    window_close_confirmation = "NeverPrompt",
    check_for_updates = false,
    enable_wayland = true,
    detect_password_input = false,
    default_workspace = "~",
    default_cursor_style = "SteadyBlock",
    keys = {},
}) do
    config[k] = v
end

-- PLUGINS -----------------------------------------------------------------------------------------
-- TOGGLE TERM
local toggle_terminal = wezterm.plugin.require("https://github.com/zsh-sage/toggle_terminal.wez")
toggle_terminal.apply_to_config(config, {
    zoom = {
        auto_zoom_toggle_terminal = true,
    },
})

return config
