return {
    "danymat/neogen", -- Annotate functions with doc comment in several languages. Especially useful for JS and Lua.
    version = "*",
    config = true,
    keys = {
        { "<leader>a", ":Neogen <CR>", desc = "Annotate function/type" },
    },
}
