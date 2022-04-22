local augroup = vim.api.nvim_create_augroup
local auto_cmd = vim.api.nvim_create_autocmd

local group_general_settings = augroup("_general_settings", { clear = true })

-- Q to close
auto_cmd("FileType", {
    command = "nnoremap <silent> <buffer> q :close<CR>",
    pattern = { "qf", "help", "man", "lspinfo" },
    group = group_general_settings,
})

-- Global formatoptions
auto_cmd("BufEnter", {
    command = "set formatoptions=tcrnj",
    group = group_general_settings,
})
