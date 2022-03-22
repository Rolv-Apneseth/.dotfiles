vim.cmd([[
    augroup _general_settings
        autocmd!
        " Q to close certain filetypes such as help and man pages
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    augroup end
]])
