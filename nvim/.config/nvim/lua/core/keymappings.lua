local opts = { noremap = true, silent = true }

-- For convenience
local keymap = vim.api.nvim_set_keymap

-- Leader
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffer navigation
keymap("n", "L", ":bnext<CR>", opts)
keymap("n", "H", ":bprevious<CR>", opts)

-- Indent mode persistence
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
keymap("n", "Y", "y$", opts) -- make Y behave as expected

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
        { "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
        { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
        { "gR", "<cmd>lua vim.lsp.buf.rename()<CR>" },
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
        -- Snacks picker
        { "gr", ":lua Snacks.picker.lsp_references()<CR>" },
        { "gi", ":lua Snacks.picker.lsp_implementations()<CR>" },
        { "gd", ":lua Snacks.picker.lsp_definitions()<CR>" },
        { "gs", ":lua Snacks.picker.lsp_symbols()<CR>" },
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
            ["<leader>"] = { "<C-^>", "Switch to recent buffer" },
            ["."] = { "<cmd>set list!<CR>", "Toggle visibility of hidden chars" },
            ["s"] = { "<cmd>w<CR>", "Format then save" },
            ["S"] = { "<cmd>noa w<CR>", "Save without formatting" },

            g = {
                name = "Git",
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },

                -- Snacks
                L = { "<cmd>lua Snacks.git.blame_line()<CR>", "Blame (detailed)" },
                g = { "<cmd>lua Snacks.lazygit.open()<CR>", "Lazygit" },
                G = {
                    "<cmd>lua Snacks.picker.git_log()<CR>",
                    "Log",
                },
                --[[ s = { "<cmd>lua Snacks.picker.git_status()<CR>", "Git status" }, ]]
                d = {
                    "<cmd>lua Snacks.picker.git_diff()<CR>",
                    "Diff",
                },
            },
            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
                f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
                l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
                d = {
                    "<cmd>lua Snacks.picker.diagnostics()<CR>",
                    "Diagnostics",
                },
                i = { "<cmd>lua Snacks.picker.lsp_implementations()<CR>", "Implementations" },
                t = { "<cmd>lua Snacks.picker.treesitter()<CR>", "Treesitter" },
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
                name = "Pickers",
                c = { "<cmd>lua Snacks.picker.commands()<CR>", "Commands" },
                C = { "<cmd>lua Snacks.picker.colorschemes()<CR>", "Colorscheme" },
                m = { "<cmd>lua Snacks.picker.marks()<CR>", "Marks" },
                l = { "<cmd>lua Snacks.picker.lazy()<CR>", "Lazy plugin specs" },
                M = { "<cmd>lua Snacks.picker.man()<CR>", "Man Pages" },
                R = { "<cmd>lua Snacks.picker.registers()<CR>", "Registers" },
                h = { "<cmd>lua Snacks.picker.help()<CR>", "Find Help" },
                H = { "<cmd>lua Snacks.picker.highlights()<CR>", "Highlights" },
                s = { "<cmd>lua Snacks.picker.spelling()<CR>", "Suggest spelling" },
                a = { "<cmd>lua Snacks.picker.autocmds()<CR>", "Autocmds" },
                A = { "<cmd>lua Snacks.picker.command_history()<CR>", "Command History" },
            },
            z = {
                name = "zk",
                o = { "<cmd>ZkNotes { sort = { 'modified' } }<cr>", "Open notes" },
                O = {
                    "<cmd>ZkTags<cr>",
                    "Open notes - tags",
                },
                d = {
                    "<cmd>ZkNotes { sort = { 'modified' }, tags = {'daily'} }<cr>",
                    "Open notes - daily",
                },
                n = {
                    "<cmd>ZkNew { dir = 'program', title = vim.fn.input('Title: ') }<cr>",
                    "New note",
                },
                N = {
                    "<cmd>ZkNew { dir = 'daily' }<cr>",
                    "New daily note",
                },
                t = { "<cmd>e $ZK_NOTEBOOK_DIR/todo.md<cr>", "Open todo.md" },
                b = "Open notes linking TO the current buffer.",
                B = "Open notes linked BY the current buffer.",
            },

            -- Descriptions only - keymaps set elsewhere
            ["'"] = "Previous sessions",
            i = "Filetype specific",
        },
        -- Visual mode
        leader_v = {
            -- ZK
            z = {
                name = "zk",
                n = {
                    ":'<,'>ZkNewFromTitleSelection { dir = 'program' }<CR>",
                    "New note with current selection as title",
                },
                N = {
                    ":'<,'>ZkNewFromContentSelection { dir = 'program', title = vim.fn.input('Title: ') }<CR>",
                    "New note with current selection as content",
                },
            },
        },
        -- Both normal and visual modes
        leader_nv = {
            ["q"] = { "<cmd>q<CR>", "Close window" },
            ["Q"] = { "<cmd>qa!<CR>", "Force close window" },
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
