from libqtile import widget, qtile

from qtile_modules.colours import COLOURS
from qtile_modules.programs import PROGRAMS


WIDGET_PADDING = 3
FONT_SIZE = 20
FONT_SIZE_WORKSPACE_ICONS = 15
FONT_AWESOME_FONTSIZE = FONT_SIZE - 2
DEFAULT_FONT = "SF Pro Display"
FONT_AWESOME_FONT = "Font Awesome 5 Free"

FOREGROUND_COLOUR = COLOURS["white"]
ICON_COLOURS = COLOURS["purple_light"]


def separator():
    return widget.Spacer(length=10)


DEFAULT_WIDGET_STYLE = dict(
    font=DEFAULT_FONT,
    fontsize=FONT_SIZE,
    padding=WIDGET_PADDING,
    background=COLOURS["transparent"],
    foreground=FOREGROUND_COLOUR,
)

GRAPH_OPTIONS = dict(
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

WIDGETS = [
    separator(),
    # LAYOUT
    widget.CurrentLayoutIcon(
        scale=0.6,
    ),
    separator(),
    # RUN
    widget.Prompt(
        prompt="run: ",
        background=COLOURS["black"],
        padding=20,
        ignore_dups_history=True,
    ),
    # WORKSPACES
    widget.Spacer(),
    widget.GroupBox(
        font=DEFAULT_FONT,
        fontsize=FONT_SIZE_WORKSPACE_ICONS,
        highlight_method="block",
        active=FOREGROUND_COLOUR,
    ),
    widget.Spacer(),
    # OUTSIDE TEMP
    widget.WidgetBox(
        font=FONT_AWESOME_FONT,
        fontsize=FONT_AWESOME_FONTSIZE,
        foreground=ICON_COLOURS,
        text_closed="",
        text_open="",
        widgets=[
            separator(),
            widget.OpenWeather(
                location="Dublin, IE",
                format=" {icon}   {temp:.0f}°{units_temperature}   "
                "{main_feels_like:.0f}°{units_temperature}   "
                "{wind_speed} {units_wind_speed} ",
            ),
        ],
    ),
    separator(),
    # MONITORING
    widget.WidgetBox(
        font=FONT_AWESOME_FONT,
        fontsize=FONT_AWESOME_FONTSIZE,
        foreground=ICON_COLOURS,
        text_closed="",
        text_open="",
        widgets=[
            separator(),
            widget.ThermalSensor(
                tag_sensor="Tctl",
            ),
            separator(),
            widget.NvidiaSensors(),
            separator(),
            widget.CPUGraph(core="all", **GRAPH_OPTIONS),
            widget.MemoryGraph(**GRAPH_OPTIONS),
            widget.Net(
                format="{down}↓↑{up}",
                update_interval=2.0,
            ),
        ],
    ),
    separator(),
    # VOLUME
    widget.TextBox(
        font=FONT_AWESOME_FONT,
        fontsize=FONT_AWESOME_FONTSIZE,
        foreground=ICON_COLOURS,
        text="",
        mouse_callbacks={
            "Button1": lambda: qtile.cmd_spawn(PROGRAMS["volume_manager"]),
            "Button3": lambda: qtile.cmd_spawn(PROGRAMS["volume_toggle"]),
        },
    ),
    separator(),
    # DATE
    widget.WidgetBox(
        font=FONT_AWESOME_FONT,
        fontsize=FONT_AWESOME_FONTSIZE,
        foreground=ICON_COLOURS,
        text_closed="",
        text_open="",
        widgets=[
            separator(),
            widget.Clock(
                format="%a, %d %m %y",
            ),
        ],
    ),
    separator(),
    # TIME
    widget.TextBox(
        text="",
        font=FONT_AWESOME_FONT,
        fontsize=FONT_AWESOME_FONTSIZE,
        foreground=ICON_COLOURS,
    ),
    widget.Clock(
        format="%H:%M",
    ),
    separator(),
]
