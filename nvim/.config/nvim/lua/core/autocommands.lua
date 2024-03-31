local augroup = vim.api.nvim_create_augroup
local auto_cmd = vim.api.nvim_create_autocmd

local group_general_settings = augroup("_general_settings", { clear = true })

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
