---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use_rocks 'luafilesystem'
    use_rocks 'xml2lua'

    use "lukas-reineke/indent-blankline.nvim"

    use 'glepnir/dashboard-nvim'


    use 'lervag/vimtex'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    use {
        'neoclide/coc.nvim',
        branch = 'master', run = 'yarn install --frozen-lockfile',
    }

    use 'jreybert/vimagit'
    use 'octol/vim-cpp-enhanced-highlight'
    use {
        'navarasu/onedark.nvim',
        run = function ()
            require('onedark').setup()
        end
    }

    use {
        "kylechui/nvim-surround", tag = "*",
        config = function()
            require("nvim-surround").setup {
                -- Configuration here, or leave empty to use defaults
            }
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'p00f/nvim-ts-rainbow' },
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
            }
        },
    }

    use 'ghassan0/telescope-glyph.nvim'
    use 'honza/vim-snippets'
    use "ziontee113/color-picker.nvim"
    use "mfussenegger/nvim-dap"

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
    }

    use 'fatih/vim-go'

    -- Kid's stuff
    use 'wakatime/vim-wakatime'
end)
