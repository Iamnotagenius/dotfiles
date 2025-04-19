return {
    {
        'williamboman/mason.nvim',
        opts = {
            ui = {
                border = 'rounded'
            }
        },
        init = function()
            vim.lsp.enable('lua-language-server')
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require('mason-lspconfig').setup_handlers{
                function(server_name)
                    require('lspconfig')[server_name].setup {}
                end
            }
        end
    },
    'neovim/nvim-lspconfig',
}
