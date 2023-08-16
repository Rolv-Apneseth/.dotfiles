return {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
        lookForwardSmall = 5, -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
        lookForwardBig = 25,  -- lines to seek forwards for "big" textobjs (mostly linewise textobjs)
        useDefaultKeymaps = true,
        disabledKeymaps = {}, -- disable some default keymaps, e.g. { "ai", "ii" }
    },
}
