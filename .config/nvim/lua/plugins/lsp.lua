return {
    -- LSPs
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/nvim-cmp",
            "ray-x/lsp_signature.nvim"
        },
        config = function()
            vim.lsp.enable("pyright")
            vim.lsp.enable("lua_ls")
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
        },
        config = function()
            local luasnip = require('luasnip') -- nvim-cmp source for luasnip
            local lspkind = require('lspkind') -- icons
            local cmp = require("cmp")

            -- Friendly snippets
            require("luasnip.loaders.from_vscode").lazy_load()

            cmp.setup {
                -- Snippet
                snippet = {
                    expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                    end,
                },
                -- Rounded borders
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                -- Enable in-line suggestions
                experimental = { ghost_text = true },
                -- Icons
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = 30,
                        ellipsis_char = '...',
                        show_labelDetails = false,
                    })
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
                    -- C-b (back) C-f (forward) for snippet placeholder navigation.
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                    },
                    ['<Down>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                    end, { 'i', 's' }),
                    ['<Up>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                    end, { 'i', 's' }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            }
        end
    },
    {
        "ray-x/lsp_signature.nvim",
        config = function()
                vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local bufnr = args.buf
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    require("lsp_signature").on_attach({
                    bind = true,
                    hint_enable = false,
                    toggle_key = '<C-s>',
                    }, bufnr)
            end,
            })
        end
    }
}
