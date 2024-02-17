#!/bin/env python3
import os


def get_var(var):
    return os.getenv(var) or f"${var}"


# BASE CONFIG
config = """
monitor=, preferred, auto, 1
# monitor=DP-1,2560x1440@144,auto,2

# OPTIONS -------------------------------------------------------------------------------
input {
    kb_layout = us
}

general {
    gaps_in = 10
    gaps_out = 12
    border_size = 1
    col.active_border = rgba(ff00ffff) rgba(bb00bbaa) 45deg
    col.inactive_border = rgba(595959aa)

    layout = master
    no_border_on_floating = yes
    cursor_inactive_timeout = 0
}

decoration {
    rounding = 10

    drop_shadow = yes
    shadow_range = 10
    shadow_render_power = 1
    shadow_offset = 5 5
    col.shadow = rgba(00000044)
    col.shadow_inactive = rgba(00000044)

    blur {
        enabled = yes
        size = 3
        passes = 2
        new_optimizations = true
    }
}

animations {
    enabled = yes
}

dwindle {
    preserve_split = yes
}

master {
    new_is_master = false
    inherit_fullscreen = true
    no_gaps_when_only = true
}

misc {
    disable_hyprland_logo = true
    disable_splash_rendering = true
    vfr = on
    disable_autoreload = false
}

# WINDOW RULES --------------------------------------------------------------------------
# Custom class for floating
windowrulev2 = float, class:floating
windowrulev2 = nofullscreenrequest, class:floating
# programs which should always float
windowrulev2 = float, class:flameshot
windowrulev2 = nofullscreenrequest, class:flameshot

# common modals
windowrule = float,title:^(Open)$
windowrule = float,title:^(Choose Files)$
windowrule = float,title:^(Save As)$
windowrule = float,title:^(Confirm to replace files)$
windowrule = float,title:^(File Operation Progress)$

windowrule = center,pavucontrol
windowrule = float,pavucontrol

windowrule = float,file-roller

# EXECUTE ON STARTUP --------------------------------------------------------------------
# Fixes
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
exec-once = xsettingsd
exec-once = hyprctl setcursor "Bibata-Original-Classic" "24"

# Base
exec-once = /usr/lib/polkit-kde-authentication-agent-1
exec-once = waybar
exec-once = nm-applet
exec-once = swww init; sleep 0.1; swww_bg ~/repos/Wallpapers/main

# Clipboard
exec-once = wl-paste -t text --watch clipman store --no-persist --notify
exec-once = wl-clip-persist --clipboard regular

# Scripts
$SCRIPTS_DIR = /home/rolv/.config/hypr/scripts
exec-once = $SCRIPTS_DIR/xdg.sh
exec = $SCRIPTS_DIR/gsettings.sh

# BINDINGS ------------------------------------------------------------------------------
# Bindings
# See https://wiki.hyprland.org/Configuring/Keywords/ for more
binds {
    workspace_back_and_forth = true
}

$M = SUPER
$A = ALT
$MS = SUPER SHIFT
$MA = SUPER ALT
$MC = SUPER CONTROL

# Power
bind = $MS, S, exec, poweroff --no-wall
bind = $MS, R, exec, reboot --no-wall
bind = $MS, Q, exec, hyprctl dispatch exit

# Terminal
bind = $M, Return, exec, "$TERMINAL"

# Browser
bind = $M, F, exec, "$BROWSER"
bind = $M, O, exec, "$BROWSER" https://stackoverflow.com/questions/tagged?sort=Newest&filters=NoAnswers&tagMode=Watched&uqlId=33538
bind = $M, Y, exec, "$BROWSER" https://www.youtube.com/
bind = $M, G, exec, "$BROWSER" https://github.com/Rolv-Apneseth

# Windows
bind = $M, W, killactive,
bind = $M, Space, fullscreen,

# Window resize submap
bind=$A,R,submap,resize
submap=resize
binde=,l,resizeactive,100 0
binde=,h,resizeactive,-100 0
binde=,k,resizeactive,0 -100
binde=,j,resizeactive,0 100
bind=,escape,submap,reset
submap=reset

# Move focus
bind = $M, L, layoutmsg, focusmaster auto
bind = $M, H, layoutmsg, focusmaster auto
bind = $M, J, layoutmsg,cyclenext
bind = $M, K, layoutmsg, cycleprev

bind = $MS, L, layoutmsg, swapwithmaster auto
bind = $MS, H, layoutmsg, swapwithmaster auto
bind = $MS, K, layoutmsg, swapprev
bind = $MS, J,layoutmsg, swapnext

# Workspaces
bind = $M, 1, workspace, 1
bind = $M, 2, workspace, 2
bind = $M, 3, workspace, 3
bind = $M, 4, workspace, 4
bind = $M, 5, workspace, 5
bind = $M, 6, workspace, 6
bind = $M, 7, workspace, 7
bind = $M, 8, workspace, 8
bind = $M, 9, workspace, 9
bind = $M, 0, workspace, 10

# Move active window to a workspace with M + $S + [0-9]
bind = $MS, 1, movetoworkspacesilent, 1
bind = $MS, 2, movetoworkspacesilent, 2
bind = $MS, 3, movetoworkspacesilent, 3
bind = $MS, 4, movetoworkspacesilent, 4
bind = $MS, 5, movetoworkspacesilent, 5
bind = $MS, 6, movetoworkspacesilent, 6
bind = $MS, 7, movetoworkspacesilent, 7
bind = $MS, 8, movetoworkspacesilent, 8
bind = $MS, 9, movetoworkspacesilent, 9
bind = $MS, 0, movetoworkspacesilent, 10

# Scroll through existing workspaces with M + scroll
bind = $M, mouse_down, workspace, e+1
bind = $M, mouse_up, workspace, e-1

# Move/resize windows with M + LMB/RMB and dragging
bindm = $M, mouse:272, movewindow
bindm = $M, mouse:273, resizewindow

# Media keys
binde=,XF86AudioLowerVolume,  exec, change_volume down
binde=,XF86AudioRaiseVolume,  exec, change_volume up
bind =,XF86AudioMute,         exec, change_volume toggle
# bind =,XF86AudioMicMute,      exec,
# binde=,XF86MonBrightnessUp,   exec,
# binde=,XF86MonBrightnessDown, exec,
# bind =,XF86AudioPlay,         exec,
# bind =,XF86AudioPrev,         exec,
# bind =,XF86AudioNext,         exec,
"""

# BASIC TEMPLATING
config = f"""{config}
# PYTHON TEMPLATING ---------------------------------------------------------------------
# Terminal extras
bind = $MS, Return, exec, {get_var("TERMINAL_DIR")} "$(last_dir)"

# Editor
bind = $M, N, exec, {get_var("TERMINAL_EXECUTE")} "$EDITOR"
bind = $MS, N, exec, {get_var("TERMINAL_EXECUTE")} "$EDITOR" "$(last_dir)"

# File explorer
bind = $M, T, exec, {get_var("MY_EXPLORER")}
bind = $MS, T, exec, {get_var("MY_EXPLORER")} "$(last_dir)"

# Rofi
bind = $M, D, exec, {get_var( "MY_LAUNCHER" )}
bind = $MS, D, exec, {get_var("MY_GAMES_LAUNCHER")}
bind = $M, C, exec, {get_var("MY_CLIPBOARD")}
bind = $MS, C, exec, {get_var("MY_CALCULATOR")}
bind = $M, S, exec, {get_var("MY_SELECTOR_DEFAULT_SOUND_SINK")}
bind = $M, E, exec, {get_var("MY_SELECTOR_EDIT_FILE")}
bind = $M, I, exec, {get_var("MY_SELECTOR_ICONS")}
bind = $MS, I, exec,{get_var("MY_SELECTOR_EMOJIS")}

# Music
bind = $M, M, exec, {get_var("MY_MUSIC_TOGGLE")}
bind = $MS, M, exec, {get_var("MY_MUSIC_NEXT")}

# Screenshot
bind = $M, P, exec, flameshot gui

# Wallpaper
bind = $M, B, exec, killall swww_bg; swww_bg ~/repos/Wallpapers/main
# bind = $MS, B, exec, wpaperctl previous-wallpaper

# Notes - zk
bind = $M, Z, exec, [floating;dimaround;size 50% 80%;center] {get_var("TERMINAL_EXECUTE")} --class floating nvim -c 'ZkNotes'

# System monitoring
bind = $MS, X, exec, [floating;dimaround;size 50% 80%;center] {get_var("TERMINAL_EXECUTE")} --class floating btm
"""


# AUTO FULLSCREEN
def get_auto_fullscreen_rule(window_class):
    return f"windowrulev2 = fullscreen,class:^({window_class.lower()})$,floating:0"


auto_fullscreen_classes = ["firefox", "thunderbird", "google-chat-linux"]
auto_fullscreen_output = "\n".join(
    [get_auto_fullscreen_rule(window_class) for window_class in auto_fullscreen_classes]
)


# STARTUP PROGRAMS
def get_startup_program_rule_and_exec(workspace_index, var):
    return f"exec-once=[workspace {workspace_index} silent] {get_var(var)}"


startup_programs = [
    "BROWSER",
    "TERMINAL",
    "",
    "",
    "MY_WORK_COMMUNICATION",
    "MY_EMAIL_CLIENT",
]
startup_programs_output = "\n".join(
    [
        get_startup_program_rule_and_exec(workspace_index, var)
        for (workspace_index, var) in enumerate(startup_programs, start=1)
        if var != ""
    ]
)

config = f"""{config}
# Auto fullscreen
{get_auto_fullscreen_rule(get_var("MY_WORK_COMMUNICATION"))}
{get_auto_fullscreen_rule(get_var("MY_EMAIL_CLIENT"))}
{get_auto_fullscreen_rule(get_var("BROWSER"))}

# Startup programs
{startup_programs_output}
"""

# WRITE TO HYPRLAND.CONF
with open("/home/rolv/.config/hypr/hyprland.conf", "w") as f:
    f.write(config)
    print("Config written to hyprland.conf")
