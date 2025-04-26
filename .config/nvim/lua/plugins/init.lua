return {
    'dstein64/vim-startuptime',
    {
        'yorickpeterse/nvim-pqf',
        opts = {
            error = ' ',
            warn = ' ',
            hint = ' ',
            info = ' '
        }
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = {
            indent = {
                char = '│'
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "lspinfo",
                    "packer",
                    "checkhealth",
                    "help",
                    "man",
                    "gitcommit",
                    "TelescopePrompt",
                    "TelescopeResults",
                    "dashboard",
                    ""
                }
            }
        }
    },
    {
        'pwntester/octo.nvim',
        opts = {}
    },
    -- {
    --     "L3MON4D3/LuaSnip",
    --     -- follow latest release.
    --     version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    --     -- install jsregexp (optional!).
    --     build = "make install_jsregexp",
    --     keys = {
    --         { '<C-f>', function () require('luasnip').jump( 1) end, mode = { 'i', 's' }, silent = false },
    --         { '<C-b>', function () require('luasnip').jump(-1) end, mode = { 'i', 's' }, silent = true }
    --     }
    -- },
    -- {
    --     "iurimateus/luasnip-latex-snippets.nvim",
    --     lazy = true,
    --     ft = { 'tex', 'latex' },
    --     -- replace "lervag/vimtex" with "nvim-treesitter/nvim-treesitter" if you're
    --     -- using treesitter.
    --     dependencies = { 'L3MON4D3/LuaSnip', 'nvim-treesitter/nvim-treesitter' },
    --     opts = {
    --         use_treesitter = true
    --     }
    -- },

    {
        'windwp/nvim-autopairs',
        opts = {
            map_cr = true
        }
    },

    {
        'NvChad/nvim-colorizer.lua',
        opts = {
            user_default_options = {
                css_fn = true,
                css = true,
                names = false
            }
        }
    },

    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
        }
    },
    {
        'lewis6991/gitsigns.nvim',
        tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            {
                "<leader>td",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>tD",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>ts",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>tl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>tL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>tQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },
    'kyazdani42/nvim-web-devicons',
    {
        -- Common dependency
        'nvim-lua/plenary.nvim',
        lazy = true
    },
    {
        "kylechui/nvim-surround",
        version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {
            keymaps = {
                visual_line = 'qS'
            }
        }
    },
    {
        "echasnovski/mini.comment",
        opts = {},
    },
    {
        'echasnovski/mini.splitjoin',
        version = '*',
        opts = {}
    },

    'HiPhish/rainbow-delimiters.nvim',
    'nvim-treesitter/nvim-treesitter-context',

    {
        'mfussenegger/nvim-jdtls',
        lazy = true,
        ft = { 'java' }
    },
    {
        'ziontee113/color-picker.nvim',
        lazy = true,
        opts = {
            ["icons"] = { "█", "" },
        },
        keys = {
            { '<leader>c', '<cmd>PickColor<cr>', noremap = true, silent = true },
            { '<M-c>', '<cmd>PickColorInsert<cr>', noremap = true, silent = true }
        }
    },

    {
        'jrop/jq.nvim',
        lazy = true,
        cmd = 'Jq'
    },

    {
        'klen/nvim-config-local',
        opts = {
            lookup_parents = true
        }
    },

    -- Kid's stuff
    'wakatime/vim-wakatime',
    {
        'IogaMaster/neocord',
        opts = {
            global_timer = true,
            logo = "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1200px-Neovim-mark.svg.png"
        }
    }
}
