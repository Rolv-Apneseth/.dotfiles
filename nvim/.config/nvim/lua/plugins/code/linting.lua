-- REQUIRED EXTERNAL BINARIES
-- eslint_d markdownlint flake8 typos

local constants = require("core.constants")
local require_plugin = require("core.helpers").require_plugin

local JS_LINTERS = { "eslint" }

return {
    "mfussenegger/nvim-lint",
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
            markdown = { "markdownlint" },
            python = { "flake8" },
            zsh = { "zsh" },

            -- 😥
            javascript = JS_LINTERS,
            javascriptreact = JS_LINTERS,
            typescript = JS_LINTERS,
            typescriptreact = JS_LINTERS,
            html = vim.tbl_extend("keep", { "tidy" }, JS_LINTERS),
        }

        -- FLAKE8
        lint.linters.flake8.args = {
            "--max-line-length",
            constants.LINE_LENGTH,
            "--ignore",
            "E203, E266, E501, W503",
        }
    end,
}
