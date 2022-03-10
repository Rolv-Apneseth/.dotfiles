vim.cmd([[
    augroup _general_settings
        autocmd!
        " Q to close certain filetypes such as help and man pages
        autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    augroup end

    " augroup _lsp
    "     autocmd!
    "     " Auto format on save (currently done with function)
    "     autocmd BufWritePre * lua vim.lsp.buf.formatting()
    " augroup end
]])
