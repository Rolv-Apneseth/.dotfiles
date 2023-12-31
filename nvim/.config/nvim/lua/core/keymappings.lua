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
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

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
keymap("n", "Y", "y$", opts)   -- make Y behave as expected

-- Keep cursor centered
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "J", "mzJ`z", opts)

-- Undo break points
local undo_breakpoint_chars = ",.!?/"
for char in undo_breakpoint_chars:gmatch(".") do
    keymap("i", char, char .. "<C-g>u", opts)
end

-----------------------------------------------------------------------------------------
-- OTHERS
-----------------------------------------------------------------------------------------
return {
    lsp = {
        { "gi",    "<cmd>lua vim.lsp.buf.implementation()<CR>" },
        -- Set in ufo so it can also be used for previewing folds
        --[[ { "K",     "<cmd>lua vim.lsp.buf.hover()<CR>" }, ]]
        { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
        { "gR",    "<cmd>lua vim.lsp.buf.rename()<CR>" },
        {
            "[d",
            '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>',
        },
        {
            "gl",
            '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
        },
        {
            "]d",
            '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>',
        },
        { "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
        -- Telescope
        { "gr", "<cmd>Telescope lsp_references<CR>" },
        { "gd", "<cmd>Telescope lsp_definitions<CR>" },
        { "gD", "<cmd>Telescope diagnostics<CR>" },
    },
    treesitter = {
        text_object = {
            select = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        autopairs = { fastwrap = "<A-e>" },
    },
    surround = {
        normal = "m",
        normal_line = "M",
        visual = "m",
        visual_line = "M",
        delete = "ds",
        change = "cs",
    },
    whichkey = {
        -- Normal mode
        leader_n = {
            ["s"] = { "<cmd>w<CR>", "Format then save" },
            ["S"] = { "<cmd>noa w<CR>", "Save without formatting" },

            g = {
                name = "Git",
                g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
                d = {
                    "<cmd>Gitsigns diffthis HEAD<CR>",
                    "Diff",
                },
                b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
            },
            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
                f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
                l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
                d = {
                    "<cmd>Telescope diagnostics<CR>",
                    "Diagnostics",
                },
                i = { "<cmd>Telescope lsp_implementations<CR>", "Implementations" },
                t = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
            },
            c = {
                name = "Rust tools",
                r = { "<cmd>RustRunnables<CR>", "Runnables" },
                d = { "<cmd>RustDebuggables<CR>", "Debuggables" },
                c = {
                    "<cmd>RustOpenCargo<CR>",
                    "Open Cargo.toml",
                },
                p = {
                    "<cmd>RustParentModule<CR>",
                    "Parent module",
                },
            },
            d = {
                name = "Debugging",
                t = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint" },
                d = { "<cmd>DapTerminate<CR>", "Terminate" },
                o = { "<cmd>DapStepOver<CR>", "Step over" },
                O = { "<cmd>DapStepOut<CR>", "Step out" },
                i = { "<cmd>DapStepInto<CR>", "Step into" },
                c = { "<cmd>DapContinue<CR>", "Continue" },
                u = { '<cmd>lua require("dapui").open()<CR>', "Open UI" },
                U = { '<cmd>lua require("dapui").close()<CR>', "Close UI" },
            },
            t = {
                name = "Telescope",
                b = { "<cmd>Telescope buffers<CR>", "Buffers" },
                C = { "<cmd>Telescope commands<CR>", "Commands" },
                H = { "<cmd>Telescope highlights<CR>", "Highlights" },
                M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
                m = { "<cmd>Telescope reloader<CR>", "Module reloader" },
                R = { "<cmd>Telescope registers<CR>", "Registers" },
                c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
                h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
                k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
                g = { "<cmd>Telescope git_files<CR>", "Open changed file" },
                s = { "<cmd>Telescope spell_suggest<CR>", "Suggest spelling" },
                F = { "<cmd>Telescope filetypes<CR>", "Available filetypes" },
            },
            z = {
                name = "zk",
                o = { "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", "Open notes" },
                O = {
                    "<Cmd>ZkTags<CR>",
                    "Open notes - tags",
                },
                n = {
                    "<Cmd>ZkNew { dir = 'program', title = vim.fn.input('Title: ') }<CR>",
                    "New note",
                },
                b = "Open notes linking TO the current buffer.",
                B = "Open notes linked BY the current buffer.",
            },
        },
        -- Visual mode
        leader_v = {
            -- ZK
            z = {
                name = "zk",
                n = {
                    "<Cmd>'<,'>ZkNewFromTitleSelection { dir = 'program' }<CR>",
                    "New note with current selection as title",
                },
                N = {
                    "<Cmd>'<,'>ZkNewFromContentSelection { dir = 'program', title = vim.fn.input('Title: ') }<CR>",
                    "New note with current selection as content",
                },
            },
        },
        -- Both normal and visual modes
        leader_nv = {
            ["q"] = { "<cmd>q<CR>", "Close window" },
            ["Q"] = { "<cmd>q!<CR>", "Force close window" },
            ["w"] = {
                "<cmd>Bdelete<CR>",
                "Close current buffer",
            },
            ["W"] = {
                "<cmd>%bd|e#|bd#<CR>",
                "Close all buffers except current",
            },
            ["p"] = { '"+p', "Paste from system clipboard (ahead)" },
            ["P"] = { '"+P', "Paste from system clipboard (behind)" },
            ["y"] = { '"+y', "Copy to system clipboard" },
            ["Y"] = { '"+y$', "Copy remainder of the line to system clipboard" },
        },
    },
}
