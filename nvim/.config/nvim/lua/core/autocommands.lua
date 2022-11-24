local helpers = require("core.helpers")
local augroup = vim.api.nvim_create_augroup
local auto_cmd = vim.api.nvim_create_autocmd

local group_general_settings = augroup("_general_settings", { clear = true })

-- Format on save (with LSP)
local excluded_filetypes = { "text" }
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

-- Open dashboard when last buffer is closed
-- Requires: bufdelete, alpha
local bufdelete = helpers.require_plugin("bufdelete")
local alpha = helpers.require_plugin("alpha")
if bufdelete and alpha then
    augroup("alpha_on_empty", { clear = true })
    auto_cmd("User", {
        pattern = "BDeletePre",
        group = "alpha_on_empty",
        callback = function(event)
            local found_non_empty_buffer = false
            local buffers = helpers.get_listed_buffers()

            for _, bufnr in ipairs(buffers) do
                if not found_non_empty_buffer then
                    local name = vim.api.nvim_buf_get_name(bufnr)
                    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

                    if
                        bufnr ~= event.buf
                        and name ~= ""
                        and name ~= "NvimTree_"
                        and ft ~= "Alpha"
                    then
                        found_non_empty_buffer = true
                    end
                end
            end

            if not found_non_empty_buffer then
                vim.api.nvim_command(":Alpha")
            end
        end,
    })
end
