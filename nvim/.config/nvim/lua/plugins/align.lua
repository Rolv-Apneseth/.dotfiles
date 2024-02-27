return {
    "Vonr/align.nvim", -- Allows aligning multiple lines with each other
    branch = "v2",
    lazy = true,
    init = function()
        vim.keymap.set("x", "<leader>A", function()
            require("align").align_to_string({
                preview = true,
                regex = true,
            })
        end, { noremap = true, silent = true, desc = "Align to regex expression" })
    end,
}
