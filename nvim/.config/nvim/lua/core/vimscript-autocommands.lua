vim.cmd([[
    augroup _general_settings
        autocmd!
        " Q to close certain filetypes such as help and man pages
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    augroup end
]])

-- When updated use
-- local augroup = vim.api.nvim_create_augroup
-- local auto_cmd = vim.api.nvim_create_autocmd
--
-- local group_general_settings = augroup("_general_settings", { clear = true })
--
-- auto_cmd("!", {
--     command = "nnoremap <silent> <buffer> q :close<CR>",
--     pattern = { "qf", "help", "man", "lspinfo", group = group_general_settings },
-- })
