-- Convenience
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    vim.notify("Installing packer, please restart your nvim.")
    vim.cmd([[packad packer.nvim]])
end

-- Autocommand to reload nvim whenever you save this file (plugins.lua)
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]])

-- Load packer and quit if not found
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer not found.")
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})
-- Install plugins
return packer.startup(function(use)
    -- Have packer manage itself
    use("wbthomason/packer.nvim")

    -- Dependency (popup API implementation for neovim)
    use("nvim-lua/popup.nvim")
    -- Dependency (lots of useful lua functions)
    use("nvim-lua/plenary.nvim")
    -- Dependency (icons)
    use("kyazdani42/nvim-web-devicons")

    -- Colorscheme
    use("Rolv-Apneseth/onedarker.nvim")

    -- Autocompletion (cmp)
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer") -- language server installer
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

    -- Convenience
    use("numToStr/Comment.nvim")
    use("windwp/nvim-autopairs")
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && yarn install",
        cmd = "MarkdownPreview",
    })
    use("moll/vim-bbye") -- proper bdelete command which never closes nvim
    use("folke/which-key.nvim") -- for showing shortcuts
    use("justinmk/vim-sneak") -- for easier navigation around a file

    -- Nvimtree
    use("kyazdani42/nvim-tree.lua")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("p00f/nvim-ts-rainbow")

    -- Telescope
    use("nvim-telescope/telescope.nvim")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Bufferline
    use("akinsho/bufferline.nvim")

    --Status line
    use("nvim-lualine/lualine.nvim")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
