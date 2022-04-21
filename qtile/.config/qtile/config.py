from libqtile import bar, hook, layout, qtile
from libqtile.config import Click, Drag
from libqtile.config import EzKey as Key
from libqtile.config import Group, Match, Screen
from libqtile.lazy import lazy
from qtile_modules.colours import COLOURS
from qtile_modules.keys import KEYS, MOD_KEY
from qtile_modules.layouts import LAYOUTS
from qtile_modules.programs import PROGRAMS
from qtile_modules.widgets import DEFAULT_WIDGET_STYLE, WIDGETS

# KEYS
keys = KEYS

# MISC OPTIONS
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wmname = "LG3D"

# LAYOUTS
layouts = LAYOUTS

# FLOATING LAYOUTS
floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)
mouse = [
    Drag(
        [MOD_KEY],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD_KEY],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([MOD_KEY], "Button2", lazy.window.bring_to_front()),
    Click([MOD_KEY], "Button1", lazy.window.toggle_floating()),
]

# GROUPS
groups_info = dict(
    # labels=("", "", "", "", "", "", "", ""),
    labels=("●" for _ in range(8)),
    layouts=(
        "max",
        "monadtall",
        "monadtall",
        "monadtall",
        *["max" for _ in range(4)],
    ),
    spawns=(
        [PROGRAMS["browser"], PROGRAMS["tech_news"]],
        PROGRAMS["editor"],
        "",
        "",
        PROGRAMS["work_communication"],
        PROGRAMS["email_client"],
        "",
        "",
    ),
    # Used mostly to move the programs spawned on startup to the correct group (most of
    # them seem to just spawn in the first group regardless)
    matches=(
        [Match(role="browser")],
        [Match(wm_class="VSCodium")],
        [],
        [],
        [Match(wm_class=["skype", "zoom"])],
        [],
        [],
        [],
    ),
)

groups = []
for i, group_label in enumerate(groups_info["labels"]):
    group_name = str(i + 1)  # So groups are named "1", "2" etc.

    # Add to groups
    groups.append(
        Group(
            name=group_name,
            layout=groups_info["layouts"][i],
            label=group_label,
            spawn=groups_info["spawns"][i],
            matches=groups_info["matches"][i],
        )
    )
    # Add group control to keys
    keys.extend(
        [
            Key(
                f"M-{group_name}",
                lazy.group[group_name].toscreen(toggle=True),
                desc=f"Change to group {group_name}:{group_label}",
            ),
            Key(
                f"M-S-{group_name}",
                lazy.window.togroup(group_name),
                desc=f"Move window to group {group_name}:{group_label}",
            ),
        ]
    )

# SCREENS AND WIDGETS
widget_defaults = DEFAULT_WIDGET_STYLE
extension_defaults = widget_defaults

screens = [
    Screen(
        top=bar.Bar(
            widgets=WIDGETS,
            size=35,
            background=COLOURS["black"],
            opacity=0.8,
        ),
    ),
]


# HOOKS
def _bar():
    """
    Hides/shows top bar based on whether current layout is 'max'
    i.e. the top bar is set to hidden when layout is 'max'

    This code was not written by me (just slightly improved)
    and was found here:
    https://github.com/qtile/qtile/issues/1787#issuecomment-646805072
    """

    bar = qtile.current_screen.top
    is_shown = qtile.current_layout.info()["name"] != "max"

    bar and bar.show(is_shown)


# ON LAYOUT CHANGE
@hook.subscribe.layout_change
def layout_change(layout, group):
    _bar()


# ON GROUP CHANGE
@hook.subscribe.changegroup
def group_change():
    _bar()


# ON CLIENT FOCUS CHANGE
@hook.subscribe.client_focus
def focus_change(window):
    _bar()
