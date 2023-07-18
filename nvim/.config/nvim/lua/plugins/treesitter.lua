local keymaps_text_object = require("core.keymappings").treesitter.text_object
local require_plugin = require("core.helpers").require_plugin

return {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-textobjects",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local nvim_treesitter = require_plugin("nvim-treesitter")
            local configs = require_plugin("nvim-treesitter.configs")
            if not nvim_treesitter or not configs then
                return
            end

            configs.setup({
                ensure_installed = "all", -- "all", or a list of languages
                sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
                auto_install = true, -- install missing parsers when entering buffer
                ignore_install = {}, -- List of parsers to ignore installing
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = { "" }, -- list of language that will be disabled
                    additional_vim_regex_highlighting = { "markdown" },
                },
                indent = { enable = true, disable = { "yaml", "python" } },
                hijack_directories = {
                    enable = true,
                    auto_open = true,
                },
                -- EXTENSIONS
                -- Autopair brackets, strings etc. (windwp/nvim-autopairs)
                autopairs = {
                    enable = true,
                },
                -- Context based commentstring (JoosepAlviste/nvim-ts-context-commentstring)
                context_commentstring = {
                    enable = true,
                    enable_autocmd = false,
                },
                -- Auto-tags for html etc.
                autotag = {
                    enable = true,
                },
                -- Text objects (nvim-treesitter/nvim-treesitter-textobjects)
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,
                        keymaps = keymaps_text_object.select,
                    },
                    swap = {
                        enable = true,
                        swap_next = keymaps_text_object.swap_next,
                        swap_previous = keymaps_text_object.swap_previous,
                    },
                },
            })
        end,
    },
}
