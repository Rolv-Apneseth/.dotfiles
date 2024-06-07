return {
    -- COMPLETION
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        -- SNIPPETS
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
        "saadparwaiz1/cmp_luasnip",
    },
    event = "InsertEnter",
    config = function()
        local require_plugin = require("core.helpers").require_plugin

        local cmp = require_plugin("cmp")
        local luasnip = require_plugin("luasnip")
        if not cmp or not luasnip then
            return
        end

        local compare = require("cmp.config.compare")
        local icons = require("core.icons")
        local kind_icons = icons.kind

        local buffer_fts = {
            "markdown",
            "toml",
            "yaml",
            "json",
        }

        require("luasnip/loaders/from_vscode").lazy_load()

        local function contains(t, value)
            for _, v in pairs(t) do
                if v == value then
                    return true
                end
            end
            return false
        end

        vim.g.cmp_active = true

        cmp.setup({
            preselect = cmp.PreselectMode.None,
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
                ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
                ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
                ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
                ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                ["<m-o>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
                -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
                ["<C-c>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<m-j>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<m-k>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<m-c>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                ["<S-CR>"] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),
                -- Accept currently selected item. If none selected, `select` first item.
                -- Set `select` to `false` to only confirm explicitly selected items.
                ["<CR>"] = cmp.mapping.confirm({ select = false }),
                ["<Right>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, {
                    "i",
                    "s",
                }),
            }),
            formatting = {
                fields = { "kind", "abbr", "menu" },
                format = function(entry, vim_item)
                    -- Kind icons
                    vim_item.kind = kind_icons[vim_item.kind]

                    if entry.source.name == "crates" then
                        vim_item.kind = icons.ui.Package
                        vim_item.kind_hl_group = "CmpItemKindCrate"
                    end

                    -- NOTE: order matters
                    vim_item.menu = ({
                        nvim_lsp = icons.ui.Code,
                        nvim_lua = "lua",
                        luasnip = icons.kind.Snippet,
                        buffer = icons.kind.Text,
                        path = icons.kind.Interface,
                    })[entry.source.name]
                    return vim_item
                end,
            },
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "nvim_lua" },
                { name = "path" },
                {
                    name = "buffer",
                    keyword_length = 3,
                    filter = function(_, ctx)
                        if not contains(buffer_fts, ctx.prev_context.filetype) then
                            return true
                        end
                    end,
                },
            },
            sorting = {
                priority_weight = 2,
                comparators = {
                    compare.offset,
                    compare.exact,
                    -- compare.scopes,
                    compare.score,
                    compare.recently_used,
                    compare.locality,
                    -- compare.kind,
                    compare.sort_text,
                    compare.length,
                    compare.order,
                },
            },
            confirm_opts = {
                behavior = cmp.ConfirmBehavior.Replace,
                select = false,
            },
            window = {
                documentation = false,
                completion = {
                    border = "rounded",
                    winhighlight = "NormalFloat:Normal,CursorLine:Keyword,Search:None",
                },
            },
            experimental = {
                ghost_text = true,
            },
        })
    end,
}
