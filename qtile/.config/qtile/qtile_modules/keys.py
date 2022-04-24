from libqtile.config import EzKey as Key
from libqtile.lazy import lazy
from qtile_modules.programs import PROGRAMS, WEBSITES

MOD_KEY = "mod4"

KEYS = [
    # Window controls
    Key("M-<Tab>", lazy.layout.next(), desc="Move window focus to other window"),
    Key("M-h", lazy.layout.left(), desc="Move focus to left"),
    Key("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key("M-l", lazy.layout.right(), desc="Move focus to right"),
    Key("M-S-l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key("M-j", lazy.layout.down(), desc="Move focus down"),
    Key("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key("M-k", lazy.layout.up(), desc="Move focus up"),
    Key("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key("M-i", lazy.layout.grow(), desc="Grow window"),
    Key("M-S-i", lazy.layout.shrink(), desc="Shrink window"),
    Key("M-w", lazy.window.kill(), desc="Kill focused window"),
    # Layouts
    Key("M-<space>", lazy.next_layout(), desc="Change to next layout"),
    Key("M-S-<space>", lazy.prev_layout(), desc="Change to previous layout"),
    # Qtile and power
    Key("M-S-q", lazy.restart(), desc="Restart Qtile"),
    Key("M-S-c", lazy.shutdown(), desc="Shutdown Qtile"),
    Key("M-S-r", lazy.spawn("reboot"), desc="Reboot PC"),
    Key("M-S-s", lazy.spawn("shutdown now"), desc="Shutdown PC"),
    # Volume
    Key("<XF86AudioLowerVolume>", lazy.spawn("pamixer --decrease 5")),
    Key("<XF86AudioRaiseVolume>", lazy.spawn("pamixer --increase 5")),
    Key("<XF86AudioMute>", lazy.spawn("pamixer --toggle-mute")),
    # Launch programs
    Key("M-u", lazy.spawn("eww close-all"), desc="Kill eww processes"),
    Key("M-r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key(
        "M-<Return>",
        lazy.spawn(PROGRAMS["terminal"]),
        desc="Launch terminal",
    ),
    Key(
        "M-f",
        lazy.spawn(PROGRAMS["browser"]),
        desc="Launch browser",
    ),
    Key(
        "M-c",
        lazy.spawn(PROGRAMS["editor"]),
        desc="Launch text editor",
    ),
    Key(
        "M-d",
        lazy.spawn(PROGRAMS["launcher"]),
        desc="Launch program launcher e.g. rofi",
    ),
    Key(
        "M-S-d",
        lazy.spawn(PROGRAMS["games_launcher"]),
        desc="Launch games launcher",
    ),
    Key(
        "M-t",
        lazy.spawn(PROGRAMS["file_explorer"]),
        desc="Launch file explorer",
    ),
    Key(
        "M-e",
        lazy.spawn(PROGRAMS["email_client"]),
        desc="Launch email client",
    ),
    Key(
        "M-m",
        lazy.spawn(PROGRAMS["play_music"]),
        desc="Launch music player (and resume playback)",
    ),
    Key(
        "M-p",
        lazy.spawn(PROGRAMS["screenshot"]),
        desc="Launch screenshotting tool",
    ),
    Key(
        "M-b",
        lazy.spawn(f"{PROGRAMS['wallpaper_manager']} -n"),
        desc="Cycle to next wallpaper",
    ),
    Key(
        "M-S-b",
        lazy.spawn(f"{PROGRAMS['wallpaper_manager']} -p"),
        desc="Cycle to previous wallpaper",
    ),
    Key(
        "M-v",
        lazy.spawn(f"{PROGRAMS['wallpaper_manager']} -f"),
        desc="Add current wallpaper to favourites",
    ),
    # Launch websites
    Key(
        "M-g",
        lazy.spawn(WEBSITES["github"]),
        desc="Open my GitHub page.",
    ),
    Key(
        "M-o",
        lazy.spawn(WEBSITES["stack_overflow"]),
        desc="Open the questions page on Stack Overflow.",
    ),
    Key(
        "M-y",
        lazy.spawn(WEBSITES["youtube"]),
        desc="Opens Youtube.",
    ),
    Key(
        "M-n",
        lazy.spawn(WEBSITES["netflix"]),
        desc="Opens Netflix.",
    ),
]
