local require_plugin = require("core.helpers").require_plugin
local icons = require("core.icons")

return {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
        "smartpde/telescope-recent-files",
        "debugloop/telescope-undo.nvim",
    },
    config = function()
        local telescope = require_plugin("telescope")
        if not telescope then
            return
        end

        telescope.setup({
            defaults = {
                prompt_prefix = icons.ui.Telescope .. " ",
                selection_caret = icons.ui.Selection .. " ",
                path_display = { "smart" },
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        width = 0.9,
                        height = 0.7,
                        preview_cutoff = 110,
                        preview_width = 0.6,
                    },
                },
            },
            pickers = {},
            extensions = {
                recent_files = {
                    only_cwd = false,   -- only files in the cwd
                    start_files = true, -- checks if files exist before being shown in the picker
                },
                undo = {
                    use_delta = true,
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                },
            },
        })

        -- EXTENSIONS
        telescope.load_extension("recent_files")
        telescope.load_extension("undo")
        --[[ telescope.load_extension("harpoon") ]]

        local keymaps_extensions = {
            {
                "<leader>tr",
                telescope.extensions.recent_files.pick,
                "Find recently opened file",
            },
            {
                "<leader>tn",
                telescope.extensions.notify.notify,
                "Show log of notifications",
            },
        }

        for _, mapping in pairs(keymaps_extensions) do
            vim.api.nvim_set_keymap("n", mapping[1], "", {
                noremap = true,
                silent = true,
                callback = mapping[2],
                desc = mapping[3],
            })
        end
    end,
    keys = {
        { "<leader>f", ":Telescope find_files<CR>", desc = "Find file" },
        { "<leader>/", ":Telescope live_grep<CR>",  desc = "Live grep" },
        { "<leader>u", ":Telescope undo<CR>",       desc = "Undo tree" },
    },
}
