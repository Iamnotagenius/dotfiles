return {
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'onsails/lspkind.nvim' },
        },
        opts = function()
            local cmp = require('cmp')
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            return {
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'nvim_lua' },
                    --{ name = 'luasnip' },
                    { name = 'buffer',  keyword_length = 3 },
                    { name = 'path' },
                },
                mapping = {
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-j>'] = cmp.mapping.scroll_docs(4),
                    ['<CR>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.confirm({
                                select = true,
                            })
                        else
                            fallback()
                        end
                    end),

                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                formatting = {
                    format = function(entry, vim_item)
                        if vim.tbl_contains({ 'path' }, entry.source.name) then
                            local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                            if icon then
                                vim_item.kind = icon
                                vim_item.kind_hl_group = hl_group
                                return vim_item
                            end
                        end
                        return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
                    end
                }
            }
        end
    }, -- Required
    {
        'ray-x/lsp_signature.nvim',
        opts = {
            hint_prefix = "",
            toggle_key = '<M-x>',
            select_signature_key = '<M-k>',
            transparency = 40
        }
    }
}
