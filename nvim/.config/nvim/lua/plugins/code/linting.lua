-- REQUIRED EXTERNAL BINARIES
-- eslint markdownlint flake8 typos tidy tombi zsh

local constants = require("core.constants")
local require_plugin = require("core.helpers").require_plugin

local JS_LINTERS = { "eslint" }

return {
    "mfussenegger/nvim-lint",
    --[[ dev = true, ]]
    init = function() end,
    config = function()
        local lint = require_plugin("lint")
        if not lint then
            return
        end

        vim.api.nvim_create_autocmd({ "BufWritePost", "LspAttach", "InsertLeave" }, {
            callback = function()
                require("lint").try_lint()
                -- Execute for all file types
                require("lint").try_lint("typos")
            end,
        })

        lint.linters_by_ft = {
            markdown = { "rumdl" },
            python = { "flake8" },
            zsh = { "zsh" },
            toml = { "tombi" },

            -- 😥
            javascript = JS_LINTERS,
            javascriptreact = JS_LINTERS,
            typescript = JS_LINTERS,
            typescriptreact = JS_LINTERS,
            html = vim.tbl_extend("keep", { "tidy" }, JS_LINTERS),
            sql = { "sqruff" },
        }

        -- FLAKE8
        lint.linters.flake8.args = {
            "--max-line-length",
            constants.LINE_LENGTH,
            "--ignore",
            "E203, E266, E501, W503",
        }

        -- RUMDL
        lint.linters.rumdl.args = {
            "check",
            "--stdin-filename",
            function()
                return vim.api.nvim_buf_get_name(0)
            end,
            "--output=json",
            -- Custom config
            "--config=/home/rolv/.config/rumdl/config.toml",
            "-",
        }

        -- TYPOS
        lint.linters.typos.args = {
            "--ignore-identifiers-file",
            "/home/rolv/.config/nvim/spell/en.utf-8.add",
            "--format=json",
            "--force-exclude",
        }
    end,
}
