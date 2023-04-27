return {
    "ThePrimeagen/harpoon",
    opts = {
        global_settings = {
            -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            save_on_toggle = true,
            -- saves the harpoon file upon every change. disabling is unrecommended.
            save_on_change = true,
            -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            enter_on_sendcmd = false,
            -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            tmux_autoclose_windows = false,
            -- filetypes that you want to prevent from adding to the harpoon list menu.
            excluded_filetypes = { "harpoon" },
            -- set marks specific to each git branch inside git repository
            mark_branch = false,
        },
        menu = {
            -- Fixed width in characters
            --[[ width = 80, ]]
            -- Dynamic width, though note that this won't update as window is resized (oof)
            width = vim.api.nvim_win_get_width(0) - 20,
        },
    },
}
