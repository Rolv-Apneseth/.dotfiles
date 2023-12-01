-- Skip backwards compatability routines
vim.g.skip_ts_context_commentstring_module = true

return {
    "JoosepAlviste/nvim-ts-context-commentstring", -- different comment string based on context under the cursor
    opts = {
        enable_autocmd = false,
    },
}
