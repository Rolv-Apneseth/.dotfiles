from libqtile import qtile, widget
from qtile_modules.colours import COLOURS
from qtile_modules.programs import PROGRAMS

# CONSTANTS
WIDGET_PADDING = 4
FONT_SIZE = 19
FONT_SIZE_WORKSPACE_ICONS = 24
ICON_FONTSIZE = 28
DEFAULT_FONT = "SF Pro Display Bold"
ICON_FONT = "RobotoMono Nerd Font Mono"

FOREGROUND_COLOUR = COLOURS["white"]
BACKGROUND_COLOUR = COLOURS["transparent"]
ICON_COLOURS = COLOURS["purple_light"]

ICONS = dict(
    weather="",
    systray="",
    monitoring="",
    volume="",
    calendar="",
    clock="",
)


# DEFAULT STYLES
DEFAULT_WIDGET_STYLE = dict(
    font=DEFAULT_FONT,
    fontsize=FONT_SIZE,
    padding=WIDGET_PADDING,
    background=BACKGROUND_COLOUR,
    foreground=FOREGROUND_COLOUR,
)

DEFAULT_ICON_WIDGET_STYLE = dict(
    font=ICON_FONT,
    fontsize=ICON_FONTSIZE,
    foreground=ICON_COLOURS,
)

DEFAULT_GRAPH_WIDGET_STYLE = dict(
    mouse_callbacks={
        "Button1": lambda: qtile.cmd_spawn(
            PROGRAMS["system_monitor"],
        )
    },
    border_color=COLOURS["black"],
    graph_color=COLOURS["graph_line"],
    border_width=1,
    line_width=1,
    type="line",
    samples=10,
    frequency=2,
)


# WIDGETS
def separator(length=15):
    """For convenience, returns a spacer widget"""
    return widget.Spacer(length=length)


WIDGETS = [
    separator(),
    # ARCH LOGO
    widget.TextBox(
        " ",
        fontsize=55,
    ),
    separator(),
    # PROMPT
    widget.Prompt(
        prompt="Run: ",
        background=COLOURS["purple"],
        padding=20,
        ignore_dups_history=True,
    ),
    # WORKSPACES
    widget.Spacer(),
    widget.GroupBox(
        font=ICON_FONT,
        fontsize=FONT_SIZE_WORKSPACE_ICONS,
        highlight_method="block",
        active=FOREGROUND_COLOUR,
        spacing=7,
    ),
    widget.Spacer(),
    # VOLUME
    widget.TextBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text=ICONS["volume"],
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(PROGRAMS["volume_manager"]),
            "Button3": lambda: qtile.cmd_spawn(PROGRAMS["volume_toggle"]),
        },
    ),
    separator(),
    # WEATHER
    widget.WidgetBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text_closed=ICONS["weather"],
        text_open=ICONS["weather"],
        widgets=[
            separator(length=10),
            widget.OpenWeather(
                location="Dublin, IE",
                format="{icon}   {temp:.0f}°{units_temperature}   "
                "{main_feels_like:.0f}°{units_temperature}   "
                "{wind_speed} {units_wind_speed} ",
            ),
        ],
    ),
    separator(),
    # MONITORING
    widget.WidgetBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text_closed=ICONS["monitoring"],
        text_open=ICONS["monitoring"],
        widgets=[
            separator(length=10),
            widget.ThermalSensor(
                tag_sensor="Tctl",
            ),
            separator(length=10),
            widget.NvidiaSensors(),
            separator(length=10),
            widget.CPUGraph(core="all", **DEFAULT_GRAPH_WIDGET_STYLE),
            widget.MemoryGraph(**DEFAULT_GRAPH_WIDGET_STYLE),
            widget.Net(
                format="{down}↓↑{up}",
                update_interval=2.0,
            ),
        ],
    ),
    separator(length=14),
    # SYSTRAY
    widget.WidgetBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text_closed=ICONS["systray"],
        text_open=ICONS["systray"],
        widgets=[
            separator(length=10),
            widget.Systray(icon_size=20, padding=7),
        ],
    ),
    separator(),
    # DATE
    widget.WidgetBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text_closed=ICONS["calendar"],
        text_open=ICONS["calendar"],
        widgets=[
            separator(length=10),
            widget.Clock(
                format="%a, %d/%m/%y",
            ),
        ],
    ),
    separator(),
    # TIME
    widget.TextBox(
        **DEFAULT_ICON_WIDGET_STYLE,
        text=ICONS["clock"],
    ),
    widget.Clock(
        format="%H:%M",
    ),
    separator(),
]
