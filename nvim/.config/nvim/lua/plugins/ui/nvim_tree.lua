-- Requirements: trash
local icons = require("core.icons")

return {
    "kyazdani42/nvim-tree.lua", -- File tree
    lazy = false,
    opts = {
        renderer = {
            highlight_opened_files = "icon",
            icons = {
                webdev_colors = true,
                git_placement = "after",
                padding = " ",
                symlink_arrow = " ➛ ",
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                    git = true,
                },
                glyphs = {
                    default = icons.documents.File,
                    symlink = icons.documents.Symlink,
                    bookmark = icons.ui.BookMark,
                    folder = {
                        arrow_closed = icons.ui.ArrowClosed,
                        arrow_open = icons.ui.ArrowOpen,
                        default = icons.documents.Folder,
                        open = icons.documents.OpenFolder,
                        empty = icons.documents.FolderEmpty,
                        empty_open = icons.documents.OpenFolderEmpty,
                        symlink = icons.documents.SymlinkFolder,
                        symlink_open = icons.documents.SymlinkFolder,
                    },
                    git = {
                        unstaged = icons.git.Unstaged,
                        staged = icons.git.Staged,
                        unmerged = icons.git.Unmerged,
                        renamed = icons.git.Renamed,
                        deleted = icons.git.Remove,
                        untracked = icons.git.Untracked,
                        ignored = icons.git.Ignored,
                    },
                },
            },
        },
        actions = {
            open_file = {
                quit_on_open = true,
            },
            use_system_clipboard = false,
        },
        disable_netrw = true,
        hijack_netrw = true,
        auto_reload_on_write = true,
        sort_by = "case_sensitive",
        hijack_cursor = false,
        update_cwd = true,
        diagnostics = {
            enable = true,
            icons = {
                hint = icons.diagnostics.Hint,
                info = icons.diagnostics.Information,
                warning = icons.diagnostics.Warning,
                error = icons.diagnostics.Error,
            },
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = {},
        },
        system_open = {
            cmd = nil,
            args = {},
        },
        filters = {
            dotfiles = false,
            custom = {},
        },
        git = {
            enable = true,
            ignore = false,
            timeout = 500,
        },
        view = {
            width = 30,
            hide_root_folder = false,
            adaptive_size = true,
            side = "left",
            number = false,
            relativenumber = false,
        },
        trash = {
            cmd = "trash",
            require_confirm = true,
        },
    },
    keys = {
        {
            "<leader>e",
            "<cmd>NvimTreeToggle<CR>",
            desc = "Explorer",
        },
    },
}
