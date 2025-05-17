return {
    "rolv-apneseth/tfm.nvim",
    --[[ dev = true, ]]
    lazy = false,
    opts = {
        file_manager = "yazi",
        replace_netrw = true,
        enable_cmds = true,
        ui = {
            border = "rounded",
            height = 1,
            width = 1,
            x = 0.5,
            y = 0.5,
        },
        keybindings = {
            ["<C-v>"] = "<C-\\><C-O>:TfmVsplit<CR>",
            ["<C-x>"] = "<C-\\><C-O>:TfmSplit<CR>",
            ["<C-t>"] = "<C-\\><C-O>:TfmTabedit<CR>",
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
