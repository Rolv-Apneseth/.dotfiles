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

-- Autocommand to reload nvim whenever you save this file
vim.api.nvim_create_autocmd("BufWritePost", {
    command = "source <afile> | PackerSync",
    pattern = "packer_init.lua",
    group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
})

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
    -- Speed up loading Lua modules and files
    use("lewis6991/impatient.nvim")

    -- Have packer manage itself
    use("wbthomason/packer.nvim")

    -- Dependency (popup API implementation for neovim)
    use("nvim-lua/popup.nvim")
    -- Dependency (lots of useful lua functions)
    use("nvim-lua/plenary.nvim")
    -- Dependency (icons)
    use("kyazdani42/nvim-web-devicons")

    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("saadparwaiz1/cmp_luasnip")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-nvim-lua")
    use("j-hui/fidget.nvim")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("rafamadriz/friendly-snippets")

    -- LSP
    use("neovim/nvim-lspconfig")
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    --[[ use("williamboman/nvim-lsp-installer") -- language server installer ]]
    use("tamago324/nlsp-settings.nvim") -- language server settings defined in json
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("ray-x/lsp_signature.nvim") -- show function signature as you type
    use("b0o/SchemaStore.nvim") -- json schmemas
    use("christianchiarulli/lua-dev.nvim") -- developer setup for init.lua and plugin development
    use("SmiteshP/nvim-navic") -- show current code context in a bar
    use("simrat39/symbols-outline.nvim") -- tree view for showing and navigating scopes
    use("lvimuser/lsp-inlayhints.nvim") -- inlay hints used for e.g. tsserver
    use("simrat39/rust-tools.nvim") -- rust specific stuff
    use("mfussenegger/nvim-dap") -- debugging

    -- Aesthetics
    use("Rolv-Apneseth/onedark.nvim") -- colorscheme
    --[[ use("~/repos/onedark.nvim/") ]]
    -- for local development
    use("akinsho/bufferline.nvim") -- Bufferbar
    use("karb94/neoscroll.nvim") -- Smooth scroll with e.g. C-d and C-u
    use("nvim-lualine/lualine.nvim") -- Statusbar
    use("rcarriga/nvim-notify") -- Pretty notifications
    use("stevearc/dressing.nvim") -- Pretty input windows and more
    use("smjonas/inc-rename.nvim") -- Incremental highlight for lsp rename

    -- Convenience
    use("numToStr/Comment.nvim") -- comment out lines
    use("windwp/nvim-autopairs") -- auto pair brackets, quotations etc.
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = "markdown",
    })
    use("famiu/bufdelete.nvim") -- proper bdelete command which never closes nvim ]]
    use("folke/which-key.nvim") -- for showing shortcuts
    use("ggandor/lightspeed.nvim") -- for easier navigation around a file
    use("lukas-reineke/indent-blankline.nvim") -- for showing lines at different indentation levels
    use("kylechui/nvim-surround") -- for surrounding text with quotes, parentheses etc.
    use("michaeljsmith/vim-indent-object") -- indent text object
    use("christoomey/vim-titlecase") -- provides a new operator for giving text titlecase
    use("lambdalisue/suda.vim") -- sudo read and write for nvim
    use("NvChad/nvim-colorizer.lua") -- Colour highlighter

    -- Nvimtree
    use("kyazdani42/nvim-tree.lua")

    -- Treesitter / Syntax
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-ts-autotag")
    use("nvim-treesitter/nvim-treesitter-textobjects")

    -- Telescope
    use("nvim-telescope/telescope.nvim")
    use("smartpde/telescope-recent-files")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- Greeter
    use("goolord/alpha-nvim")

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
