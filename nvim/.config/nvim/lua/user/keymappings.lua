local opts = { noremap = true, silent = true }

-- For convenience
local keymap = vim.api.nvim_set_keymap

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Window resize (arrow keys)
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical -2<CR>", opts)

-- Buffer navigation
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)

-- Indent mode persistance
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move lines
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("x", "<A-j>", ":m '>+1<CR>gv-gv", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-k>", ":m '<-2<CR>gv-gv", opts)

-- Copy and paste
keymap("v", "p", '"_dP', opts) -- override default yank paste behaviour
-- Below are unecessary when using "clipboard = 'unnamedplus' in options"
-- keymap("n", "<leader>y", '"+y', opts)
-- keymap("v", "<leader>y", '"+y', opts)
-- keymap("n", "<leader>p", '"+p', opts)
-- keymap("v", "<leader>p", '"+p', opts)

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Undo break points
keymap("i", ",", ",<C-g>u", opts)
keymap("i", ".", ".<C-g>u", opts)
keymap("i", "!", "!<C-g>u", opts)
keymap("i", "?", "?<C-g>u", opts)

---------------------------------------------------------------------
-- Many other keymaps are defined in the which-key configuration file
---------------------------------------------------------------------

-- Search and replace which uses functions defined in vimscript-functions
vim.cmd([[vmap <leader>* <Esc>:/<c-r>=GetVisual()<cr><cr>]])
vim.cmd([[vmap <leader># <Esc>:%s/<c-r>=GetVisual()<cr>//g<left><left>]])
