local c = {
    fg = "#FFFFFF",
    bg = "#000000",
    colour0 = "#000000",
    colour1 = "#D90404",
    colour2 = "#29CC00",
    colour3 = "#E5E600",
    colour4 = "#0066FF",
    colour5 = "#CC00FF",
    colour6 = "#1793D1",
    colour7 = "#D0D0D0",
    colour8 = "#808080",
    colour9 = "#FE0100",
    colour10 = "#33FF00",
    colour11 = "#FEFF00",
    colour12 = "#1A76FF",
    colour13 = "#FF00FF",
    colour14 = "#00FFFF",
    colour15 = "#FFFFFF",
}

return {
    -- The default text color
    foreground = c.fg,
    -- The default background color
    background = c.bg,
    -- Overrides the cell background color when the current cell is occupied by the
    -- cursor and the cursor style is set to Block
    cursor_bg = c.fg,
    -- Overrides the text color when the current cell is occupied by the cursor
    cursor_fg = c.bg,
    -- Specifies the border color of the cursor when the cursor style is set to Block,
    -- or the color of the vertical or horizontal bar when the cursor style is set to
    -- Bar or Underline.
    cursor_border = c.colour13,
    -- the foreground color of selected text
    selection_fg = c.fg,
    -- the background color of selected text
    selection_bg = c.colour13,
    -- The color of the scrollbar "thumb"; the portion that represents the current viewport
    scrollbar_thumb = c.colour8,
    -- The color of the split lines between panes
    split = c.colour7,
    ansi = {
        c.colour0,
        c.colour1,
        c.colour2,
        c.colour3,
        c.colour4,
        c.colour5,
        c.colour6,
        c.colour7,
    },
    brights = {
        c.colour8,
        c.colour9,
        c.colour10,
        c.colour11,
        c.colour12,
        c.colour13,
        c.colour14,
        c.colour15,
    },
    -- Since: 20220319-142410-0fcdea07
    -- When the IME, a dead key or a leader key are being processed and are effectively
    -- holding input pending the result of input composition, change the cursor
    -- to this color to give a visual cue about the compose state.
    compose_cursor = c.colour3,
    -- Colors for copy_mode and quick_select
    -- available since: 20220807-113146-c2fee766
    -- In copy_mode, the color of the active text is:
    -- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
    -- 2. selection_* otherwise
    copy_mode_active_highlight_bg = { Color = c.bg },
    copy_mode_active_highlight_fg = { AnsiColor = "Black" },
    copy_mode_inactive_highlight_bg = { Color = "#52ad70" },
    copy_mode_inactive_highlight_fg = { AnsiColor = "White" },
    quick_select_label_bg = { Color = "peru" },
    quick_select_label_fg = { Color = "#ffffff" },
    quick_select_match_bg = { AnsiColor = "Navy" },
    quick_select_match_fg = { Color = "#ffffff" },
}
