return {
    "rolv-apneseth/tfm.nvim",
    dev = true,
    lazy = false,
    opts = {
        file_manager = "yazi",
        replace_netrw = true,
        enable_cmds = false,
        ui = {
            border = "rounded",
            height = 1,
            width = 1,
            x = 0.5,
            y = 0.5,
        },
        keybindings = {
            ["<ESC>"] = "q",
        },
    },
    keys = {
        {
            "<leader>e",
            function()
                require("tfm").open()
            end,
            desc = "TFM",
        },
    },
}
