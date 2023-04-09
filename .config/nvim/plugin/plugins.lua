---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use_rocks 'luafilesystem'
    use_rocks { 'xml2lua 1.5-1' }

    use "lukas-reineke/indent-blankline.nvim"
    use 'glepnir/dashboard-nvim'
    use 'lervag/vimtex'
    use 'windwp/nvim-autopairs'
    use 'NvChad/nvim-colorizer.lua'
    use 'nvim-telescope/telescope-ui-select.nvim'

    vim.g.neo_tree_remove_legacy_commands = true
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        }
    }

    use {
        'ThePrimeagen/harpoon',
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use {
        'untitled-ai/jupyter_ascending.vim',
        ft = 'python',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>e', '<Plug>(JupyterExecuteAll)', {})
            vim.api.nvim_set_keymap('n', '<leader>j', '<Plug>(JupyterExecute)', {})
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {
                -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-nvim-lua' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
            { 'onsails/lspkind.nvim' }
        }
    }

    use 'jreybert/vimagit'
    use 'octol/vim-cpp-enhanced-highlight'
    use 'navarasu/onedark.nvim'

    use {
        "kylechui/nvim-surround", tag = "*",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end
    }

    use {
        "echasnovski/mini.comment",
        config = function()
            require('mini.comment').setup()
        end
    }

    use {
        "echasnovski/mini.splitjoin",
        config = function()
            require('mini.splitjoin').setup()
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'HiPhish/nvim-ts-rainbow2', 'nvim-treesitter/nvim-treesitter-context' },
        run = ':TSUpdate',
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                requires = { 'kyazdani42/nvim-web-devicons' },
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            },
            {
                '/home/iamnotagenius/Sources/mvnsearch.nvim',
                rocks = {
                    'http', { 'xml2lua 1.5-1' }, 'Lua-cURL'
                }
            }
        },
    }

    use 'mfussenegger/nvim-jdtls'

    use 'ghassan0/telescope-glyph.nvim'
    use 'honza/vim-snippets'
    use "ziontee113/color-picker.nvim"
    use "mfussenegger/nvim-dap"

    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
    }

    use 'fatih/vim-go'

    use 'hkupty/iron.nvim'

    -- Kid's stuff
    use 'wakatime/vim-wakatime'
end)
