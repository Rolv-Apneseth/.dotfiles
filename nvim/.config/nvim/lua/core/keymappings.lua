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
        { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
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
        --[[ { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" }, ]]
        --[[ { "gr", "<cmd>lua vim.lsp.buf.references()<CR>" }, ]]
        --[[ { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" }, ]]
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

            swap_next = {
                ["<leader>c"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>C"] = "@parameter.inner",
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

            -- TREESITTER
            ["<leader>c"] = { "Move argument forward by 1 position" },
            ["<leader>C"] = { "Move argument backward by 1 position" },

            -- SYMBOLS_OUTLINE
            ["E"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },

            -- NVIM_TREE
            ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

            -- TELESCOPE
            ["f"] = { "<cmd>Telescope find_files<CR>", "Find file" },
            ["/"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },

            -- NVIM_NOTIFY + TELESCOPE
            ["n"] = { "Show log of notifications" },

            -- INC_RENAME
            ["r"] = "LSP partially rename variable",
            ["R"] = "LSP fully rename variable",

            m = {
                name = "Packer",
                c = { "<cmd>PackerCompile<CR>", "Compile" },
                i = { "<cmd>PackerInstall<CR>", "Install" },
                s = { "<cmd>PackerSync<CR>", "Sync" },
                S = { "<cmd>PackerStatus<CR>", "Status" },
                u = { "<cmd>PackerUpdate<CR>", "Update" },
            },

            v = {
                name = "Git",
                g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
                j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
                k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
                l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
                p = {
                    "<cmd>lua require 'gitsigns'.preview_hunk()<CR>",
                    "Preview Hunk",
                },
                r = {
                    "<cmd>lua require 'gitsigns'.reset_hunk()<CR>",
                    "Reset Hunk",
                },
                R = {
                    "<cmd>lua require 'gitsigns'.reset_buffer()<CR>",
                    "Reset Buffer",
                },
                s = {
                    "<cmd>lua require 'gitsigns'.stage_hunk()<CR>",
                    "Stage Hunk",
                },
                u = {
                    "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
                    "Undo Stage Hunk",
                },
                o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
                b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
                c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
                d = {
                    "<cmd>Gitsigns diffthis HEAD<CR>",
                    "Diff",
                },
            },

            l = {
                name = "LSP",
                a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
                d = {
                    "<cmd>Telescope lsp_document_diagnostics<CR>",
                    "Document Diagnostics",
                },
                w = {
                    "<cmd>Telescope lsp_workspace_diagnostics<CR>",
                    "Workspace Diagnostics",
                },
                f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
                j = {
                    "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
                    "Next Diagnostic",
                },
                k = {
                    "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
                    "Prev Diagnostic",
                },
                l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
                q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
                r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
            },

            t = {
                name = "Telescope",
                r = { "Find recently opened file" },
                b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
                c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
                h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
                H = { "<cmd>Telescope highlights<CR>", "Highlights" },
                M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
                o = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
                R = { "<cmd>Telescope registers<CR>", "Registers" },
                k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
                C = { "<cmd>Telescope commands<CR>", "Commands" },
            },
        },

        -- Visual mode
        leader_v = {
            -- TITLECASE
            ["t"] = { "gugv<Plug>Titlecase", "Convert selection to titlecase" },
        },

        -- Both normal and visual modes
        leader_nv = {
            ["q"] = { "<cmd>q<CR>", "Close window" },
            ["Q"] = { "<cmd>q!<CR>", "Force close window" },
            ["w"] = { "<cmd>Bdelete<CR>", "Close current buffer" },
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
