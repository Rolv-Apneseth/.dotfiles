return {
    "Mickael-menu/zk-nvim", -- notes
    main = "zk",
    lazy = true,
    dev = false,
    cmd = {
        "ZkNotes",
        "ZkTags",
        "ZkNew",
        "ZkNewFromTitleSelection",
        "ZkNewFromContentSelection",
    },
    opts = {
        picker = "snacks_picker",
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
    },
}
