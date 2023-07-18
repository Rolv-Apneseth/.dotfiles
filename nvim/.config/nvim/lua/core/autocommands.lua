local augroup = vim.api.nvim_create_augroup
local auto_cmd = vim.api.nvim_create_autocmd

local group_general_settings = augroup("_general_settings", { clear = true })

-- Format on save (with LSP)
local excluded_filetypes = { "text", "svg" }
auto_cmd("BufWritePre", {
    callback = function()
        -- Exclude certain filetypes
        for _, filetype in ipairs(excluded_filetypes) do
            if vim.bo.filetype == filetype then
                return
            end
        end

        -- LSP format
        vim.lsp.buf.format()
    end,
    group = augroup("lsp_document_format", { clear = true }),
})

-- Custom command execution after save
auto_cmd("BufWritePost", {
    callback = function()
        if vim.bo.filetype == "svg" then
            vim.cmd("!svgo %")
        end
    end,
    group = augroup("post_write_custom_commands", { clear = true }),
})

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
