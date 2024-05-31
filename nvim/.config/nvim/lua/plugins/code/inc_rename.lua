local cmd_name = "IncRename"

return {
    "smjonas/inc-rename.nvim", -- Incremental highlight for lsp rename
    opts = {
        cmd_name = cmd_name, -- the name of the command
        hl_group = "Substitute", -- the highlight group used for highlighting the identifier's new name
        preview_empty_name = false, -- whether an empty new name should be previewed; if false the command preview will be cancelled instead
        show_message = true, -- whether to display a `Renamed m instances in n files` message after a rename operation
        -- Usig noice instead
        --[[ input_buffer_type = "dressing", -- the type of the external input buffer to use (the only supported value is currently "dressing") ]]
        post_hook = nil, -- callback to run after renaming, receives the result table (from LSP handler) as an argument
        -- Reposition input box above cursor to not cover value being renamed
        input = {
            override = function(conf)
                conf.col = -1
                conf.row = 0
                return conf
            end,
        },
    },
    keys = {
        {
            "<leader>r",
            function()
                return ":" .. cmd_name .. " " .. vim.fn.expand("<cword>")
            end,
            expr = true,
            desc = "Rename - partial",
        },
        {
            "<leader>R",
            function()
                return ":" .. cmd_name .. " "
            end,
            expr = true,
            desc = "Rename - full",
        },
    },
}
