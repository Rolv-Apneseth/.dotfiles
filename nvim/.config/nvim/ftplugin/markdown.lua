-- Add the key mappings only for Markdown files in a zk notebook.
if require("zk.util").notebook_root(vim.fn.expand("%:p")) ~= nil then
    local function map(...)
        vim.api.nvim_buf_set_keymap(0, ...)
    end
    local opts = { noremap = true, silent = false }

    -- Open the link under the cursor.
    map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
end
