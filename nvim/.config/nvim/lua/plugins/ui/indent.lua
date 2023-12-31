-- :h ibl.config
return {
    "lukas-reineke/indent-blankline.nvim", -- for showing lines at different indentation levels
    main = "ibl",
    opts = {
        enabled = true,
        scope = {
            enabled = true,
            show_start = false,
            show_end = false,
            show_exact_scope = false,
            injected_languages = false,
            highlight = { "Label" },
            priority = 500,

            include = {
                node_type = {
                    ["*"] = {
                        "return_statement",
                        "switch_statement",
                        "table_constructor",
                    },
                },
            },
        },
        indent = {
            char = "│",
            highlight = "Comment",
            smart_indent_cap = false,
        },
        whitespace = {
            remove_blankline_trail = true,
        },
        --[[ space_char_blankline = " ", ]]
        --[[ show_current_context = true, ]]
        --[[ show_current_context_start = true, ]]
        exclude = { filetypes = { "alpha" } },
    },
}
