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
            ["<C-v>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.vsplit)<CR>",
            ["<C-x>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.split)<CR>",
            ["<C-t>"] = "<C-\\><C-O>:lua require('tfm').set_next_open_mode(require('tfm').OPEN_MODE.tabedit)<CR>",
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
