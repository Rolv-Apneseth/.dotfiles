return {
    "chrisgrieser/nvim-origami", -- Open / close folds with "h" and "l"
    event = "BufReadPost", -- later or on keypress would prevent saving folds
    opts = {
        keepFoldsAcrossSessions = true,
        pauseFoldsOnSearch = true,
        setupFoldKeymaps = true,
    },
}
