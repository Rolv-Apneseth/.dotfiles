return {
    "Mickael-menu/zk-nvim",
    -- leave as function, causes error as opts
    config = function()
        local zk = require("zk")

        zk.setup({
            picker = "telescope",
            lsp = {
                config = {
                    cmd = { "zk", "lsp" },
                    name = "zk",
                },
                auto_attach = {
                    enabled = true,
                    filetypes = { "markdown" },
                },
            },
        })

        local commands = require("zk.commands")

        commands.add("ZkOrphans", function(options)
            options = vim.tbl_extend("force", { orphan = true }, options or {})
            zk.edit(options, { title = "Zk Orphans" })
        end)
    end,
}
