local require_plugin = require("core.helpers").require_plugin

return {
    "saecki/crates.nvim", -- For managing Cargo dependencies
    event = { "BufRead Cargo.toml" },
    config = function()
        local crates = require_plugin("crates")
        if not crates then
            return
        end
        crates.setup({
            lsp = {
                enabled = true,
                actions = true,
                completion = true,
                hover = true,
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
