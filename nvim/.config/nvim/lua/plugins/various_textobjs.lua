return {
    "chrisgrieser/nvim-various-textobjs",
    opts = {
        forwardLooking = {
            small = 5, -- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
            big = 25, -- lines to seek forwards for "big" textobjs (mostly linewise textobjs)
        },
        keymaps = {
            useDefaults = true,
            disabledDefaults = { "gc" }, -- disable some default keymaps, e.g. { "ai", "ii" }
        },
    },
}
