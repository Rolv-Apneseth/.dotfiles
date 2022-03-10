from libqtile import layout

from qtile_modules.colours import COLOURS

BASE_STYLE = {
    "border_width": 1,
    "margin": 12,
    "border_focus": COLOURS["purple"],
    "border_normal": COLOURS["transparent"],
    "single_border_width": 0,
    "single_margin": 0,
}

LAYOUTS = [
    layout.Max(),
    layout.MonadTall(**BASE_STYLE),
    layout.MonadWide(**BASE_STYLE),
]
