return {
    INDENT_SIZE = 4,
    LINE_LENGTH = "89",
    TAB_WIDTH = "4",

    OTHER_KEYMAPPINGS = {
        lsp = {
            { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>" },
            { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>" },
            { "K", "<cmd>lua vim.lsp.buf.hover()<CR>" },
            { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>" },
            { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>" },
            { "gr", "<cmd>lua vim.lsp.buf.references()<CR>" },
            { "gR", "<cmd>lua vim.lsp.buf.rename()<CR>" },
            { "gq", "<cmd>lua vim.diagnostic.setloclist()<CR>" },
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
                ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
                ["E"] = { "<cmd>SymbolsOutline<CR>", "Symbols Outline" },
                ["n"] = { "<cmd>Notifications<CR>", "Show log of notifications" },

                ["s"] = { "<cmd>w<CR>", "Format then save" },
                ["S"] = { "<cmd>noa w<CR>", "Save without formatting" },

                ["f"] = { "<cmd>Telescope find_files<CR>", "Find file" },
                ["r"] = {
                    --[[ "<cmd>lua require('telescope').extensions.recent_files.pick()<CR>", ]]
                    "Find recently opened file",
                },
                ["R"] = "Rename variable", -- set in inc_rename.lua
                ["/"] = { "<cmd>Telescope live_grep<CR>", "Live grep" },

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
                    i = { "<cmd>LspInfo<CR>", "Info" },
                    I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
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
                    s = {
                        "<cmd>Telescope lsp_document_symbols<CR>",
                        "Document Symbols",
                    },
                    S = {
                        "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
                        "Workspace Symbols",
                    },
                },

                i = {
                    name = "Search",
                    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
                    c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
                    h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
                    H = { "<cmd>Telescope highlights<CR>", "Highlights" },
                    n = {
                        "<cmd>lua require('telescope').extensions.notify.notify()<CR>",
                        "Notifications",
                    },
                    M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
                    r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
                    R = { "<cmd>Telescope registers<CR>", "Registers" },
                    k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
                    C = { "<cmd>Telescope commands<CR>", "Commands" },
                },
            },

            -- Visual mode
            leader_v = {
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
    },
    ICONS = {
        kind = {
            Text = "",
            Method = "m",
            Function = "",
            Constructor = "",
            --[[ Method = "", ]]
            --[[ Function = "", ]]
            --[[ Constructor = "", ]]
            Field = "",
            Variable = "",
            --[[ Variable = "", ]]
            Class = "",
            Interface = "",
            Module = "",
            --[[ Module = "", ]]
            Property = "",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            --[[ Keyword = "", ]]
            -- Snippet = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "",
            Event = "",
            Operator = "",
            TypeParameter = "",
        },
        type = {
            Array = "",
            Number = "",
            String = "",
            Boolean = "𝐁",
            Object = "",
        },
        documents = {
            File = "",
            Files = "",
            Folder = "",
            FolderEmpty = "",
            OpenFolder = "",
            OpenFolderEmpty = "",
            Symlink = "",
            SymlinkFolder = "",
        },
        git = {
            Add = "",
            Mod = "",
            Remove = "",
            Ignore = "",
            Rename = "",
            Diff = "",
            Repo = "",
            Octoface = "",

            Unstaged = "",
            Staged = "S",
            Unmerged = "",
            Renamed = "➜",
            Untracked = "U",
            Ignored = "◌",
        },
        gitsigns = {
            AddOrChange = "▎",
            Delete = "契",
        },
        ui = {
            ArrowClosed = "",
            ArrowOpen = "",
            Lock = "",
            Circle = "",
            BigCircle = "",
            BigUnfilledCircle = "",
            HalfCircleLeft = "",
            HalfCircleRight = "",
            Close = "",
            Wrong = "✗",
            NewFile = "",
            Search = "",
            Lightbulb = "",
            Project = "",
            Dashboard = "",
            History = "",
            Comment = "",
            Bug = "",
            Code = "",
            Telescope = "",
            Selection = "",
            Gear = "",
            Package = "",
            List = "",
            SignIn = "",
            SignOut = "",
            Check = "✓",
            Next = "➜",
            Fire = "",
            Note = "",
            BookMark = "",
            Pencil = "",
            ChevronRight = "",
            Table = "",
            Calendar = "",
            CloudDownload = "",
        },
        diagnostics = {
            Error = "",
            Warning = "",
            Information = "",
            Question = "",
            Hint = "",
        },
        misc = {
            Robot = "ﮧ",
            Squirrel = "",
            Tag = "",
            Watch = "",
            Smiley = "ﲃ",
            Package = "",
            CircuitBoard = "",
        },
    },
}
