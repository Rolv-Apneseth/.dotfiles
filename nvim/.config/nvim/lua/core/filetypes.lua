vim.filetype.add({
    extension = {
        bu = "yaml",
        ign = "json",
    },
    pattern = {
        [".*/.gitconfig-*"] = "gitconfig",
    },
})
