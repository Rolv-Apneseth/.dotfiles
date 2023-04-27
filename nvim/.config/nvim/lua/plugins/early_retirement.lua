return {
    "chrisgrieser/nvim-early-retirement", -- Close buffers after inactivity
    event = "VeryLazy",
    config = true,
    opts = {
        -- if a buffer has been inactive for this many minutes, close it
        retirementAgeMins = 10,
        -- filetypes to ignore
        ignoredFiletypes = {},
        -- will not close the alternate file
        ignoreAltFile = true,
        -- minimum number of open buffers for auto-closing to become active
        minimumBufferNum = 5,
        -- will ignore buffers with unsaved changes. If false, the buffers will
        -- automatically be written and then closed.
        ignoreUnsavedChangesBufs = true,
        -- ignore non-empty buftypes, for example terminal buffers
        ignoreSpecialBuftypes = true,
        -- ignore visible buffers ("a" in `:buffers`). buffers open in a window,
        -- or in a tab are consider visible by vim
        ignoreVisibleBufs = true,
        -- ignore unloaded buffers. session-management plugin often add buffers
        -- to the buffer list without loading them
        ignoreUnloadedBufs = false,
        -- uses vim.notify for plugins like nvim-notify
        notificationOnAutoClose = true,
    },
}
