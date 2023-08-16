-- BOOTSTRAP
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    { { import = "plugins" }, { import = "plugins.lsp" }, { import = "plugins.ui" } },
    {
        diff = {
            cmd = "browser",
        },
        change_detection = {
            -- automatically check for config file changes and reload the ui
            enabled = false,
            notify = true, -- get a notification when changes are found
        },
        ui = {
            size = { width = 0.8, height = 0.8 },
            wrap = true, -- wrap the lines in the ui
            border = "rounded",
        },
        performance = {
            rtp = {
                -- disable some rtp plugins
                disabled_plugins = {
                    "gzip",
                    "netrwPlugin",
                    "tarPlugin",
                    "tohtml",
                    "tutor",
                    "zipPlugin",
                },
            },
        },
    }
)
