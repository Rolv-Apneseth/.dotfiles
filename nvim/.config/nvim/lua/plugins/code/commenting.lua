-- TODO: use built-in commenting (see https://github.com/numToStr/Comment.nvim/issues/453)
return {
    {
        "numToStr/Comment.nvim", -- comment out lines
        dependencies = {
            {
                "JoosepAlviste/nvim-ts-context-commentstring", -- different comment string based on context under the cursor
                event = "VeryLazy",
                init = function()
                    -- Skip backwards compatibility routines
                    vim.g.skip_ts_context_commentstring_module = true
                end,
                opts = {
                    enable_autocmd = false,
                },
            },
        },
        opts = {
            ---Add a space b/w comment and the line
            padding = true,
            ---Whether the cursor should stay at its position
            sticky = true,
            ---Lines to be ignored while (un)comment
            ignore = nil,
            ---LHS of toggle mappings in NORMAL mode
            toggler = {
                ---Line-comment toggle keymap
                line = "gcc",
                ---Block-comment toggle keymap
                block = "gbc",
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = "gc",
                ---Block-comment keymap
                block = "gb",
            },
            ---LHS of extra mappings
            extra = {
                ---Add comment on the line above
                above = "gcO",
                ---Add comment on the line below
                below = "gco",
                ---Add comment at the end of line
                eol = "gca",
            },
            --- Keybindings
            mappings = {
                ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                basic = true,
                ---Extra mapping; `gco`, `gcO`, `gcA`
                extra = true,
            },
            pre_hook = function(ctx)
                local utils = require("Comment.utils")
                local ts_utils = require("ts_context_commentstring.utils")
                local ts_internal = require("ts_context_commentstring.internal")
                local location = nil

                if ctx.ctype == utils.ctype.block then
                    location = ts_utils.get_cursor_location()
                elseif ctx.cmotion == utils.cmotion.v or ctx.cmotion == utils.cmotion.V then
                    location = ts_utils.get_visual_start_location()
                end

                return ts_internal.calculate_commentstring({
                    key = ctx.ctype == utils.ctype.line and "__default" or "__multiline",
                    location = location,
                })
            end,
        },
    },
}
