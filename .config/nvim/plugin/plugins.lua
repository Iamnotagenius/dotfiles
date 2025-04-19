---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'dstein64/vim-startuptime'

    use {
        'yorickpeterse/nvim-pqf',
        config = function ()
            require('pqf').setup {
                error = ' ',
                warn = ' ',
                hint = ' ',
                info = ' '
            }
        end
    }

    use "lukas-reineke/indent-blankline.nvim"
    use 'glepnir/dashboard-nvim'
    use 'lervag/vimtex'

    use {
        'pwntester/octo.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'kyazdani42/nvim-web-devicons'
        },
        config = function ()
            require('octo').setup()
        end
    }

    use {
        "iurimateus/luasnip-latex-snippets.nvim",
        -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
        -- using treesitter.
        requires = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
        config = function()
            require 'luasnip-latex-snippets'.setup { use_treesitter = true }
            -- or setup({ use_treesitter = true })
        end,
    }
    use 'windwp/nvim-autopairs'
    use 'NvChad/nvim-colorizer.lua'
    use 'nvim-telescope/telescope-ui-select.nvim'

    use { 'joeveiga/ng.nvim' }

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
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    use {
        'ThePrimeagen/harpoon',
        requires = {
            "nvim-lua/plenary.nvim",
        }
    }

    use {
        'NeogitOrg/neogit',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
        'untitled-ai/jupyter_ascending.vim',
        ft = 'python',
        config = function()
            vim.api.nvim_set_keymap('n', '<leader>J', '<Plug>JupyterExecuteAll', {})
            vim.api.nvim_set_keymap('n', '<leader>j', '<Plug>JupyterExecute', {})
            vim.api.nvim_set_keymap('n', '<leader>r', '<Plug>JupyterRestart', {})
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
            { 'saadparwaiz1/cmp_luasnip' },
            {
                'L3MON4D3/LuaSnip',
                tag = 'v1.2.*',
                run = 'make install_jsregexp'
            }, -- Required
            { 'onsails/lspkind.nvim' },
            { 'ray-x/lsp_signature.nvim' }
        }
    }

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
        requires = { 'HiPhish/rainbow-delimiters.nvim', 'nvim-treesitter/nvim-treesitter-context' },
        run = ':TSUpdate',
    }

    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
        requires = "nvim-treesitter/nvim-treesitter",
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            {
                'nvim-telescope/telescope-file-browser.nvim',
                requires = { 'kyazdani42/nvim-web-devicons' },
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            }
        },
    }

    use {
        'Iamnotagenius/mvnsearch.nvim',
        requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope.nvim' }
        },
        rocks = {
            'xml2lua 1.6-2'
        }
    }

    use 'mfussenegger/nvim-jdtls'

    use 'ghassan0/telescope-glyph.nvim'
    use 'honza/vim-snippets'
    use "ziontee113/color-picker.nvim"
    use "mfussenegger/nvim-dap"

    use {
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    }

    use 'fatih/vim-go'

    use 'hkupty/iron.nvim'

    use {
        'akinsho/git-conflict.nvim', tag = "*",
        config = function()
            require('git-conflict').setup()
        end
    }

    use {
        'barrett-ruth/live-server.nvim',
        run = 'yarn global add live-server',
        config = function ()
            require('live-server').setup()
        end
    }

    use 'aklt/plantuml-syntax'

    use {
        'mrcjkb/rustaceanvim',
        tag = "4.*",
        ft = { "rust" }
    }

    use 'jrop/jq.nvim'


    -- Kid's stuff
    use 'wakatime/vim-wakatime'
    use {
        'IogaMaster/neocord',
        config = function ()
            require('neocord').setup {
                global_timer = true,
                logo = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1200px-Neovim-mark.svg.png"
            }
        end
    }
end)
