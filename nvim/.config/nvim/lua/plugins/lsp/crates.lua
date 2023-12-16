local require_plugin = require("core.helpers").require_plugin

return {
    "saecki/crates.nvim", -- For managing Cargo dependencies
    tag = "stable",
    ft = { "toml", "rust" },
    config = function()
        require_plugin("crates").setup({
            -- Code actions via null_ls
            null_ls = {
                enabled = true,
                name = "crates.nvim",
            },
        })

        -- Lazily add cmp source
        local cmp = require_plugin("cmp")
        if not cmp then
            return
        end
        vim.api.nvim_create_autocmd("BufRead", {
            group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
            pattern = "Cargo.toml",
            callback = function()
                cmp.setup.buffer({ sources = { { name = "crates" } } })
            end,
        })
    end,
}
