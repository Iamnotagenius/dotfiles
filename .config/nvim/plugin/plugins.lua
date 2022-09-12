---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use_rocks 'luafilesystem'

    use {
        'lervag/vimtex',
        config = function ()
            require('vimtex')
        end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function ()
            require('lualine').setup {
                options = {
                    theme = 'onedark',
                },
                tabline = {
                    lualine_a = {
                        {
                            'tabs',
                            mode = 1
                        }
                    },
                    lualine_z = {
                        {
                            'buffers',
                            symbols = {
                                modified = ' ',      -- Text to show when the buffer is modified
                                alternate_file = ' ', -- Text to show to identify the alternate file
                                directory =  '',     -- Text to show when the buffer is a directory
                            }
                        }
                    }
                },
                sections = {
                        lualine_c = {
                            {
                                'filename',
                                newfile_status = true,
                                path = 3,
                                symbols = {
                                    modified = ' ',
                                    readonly = ' ',
                                    unnamed  = '',
                                    newfile  = ' ﱐ'

                                }
                            }
                        },
                        lualine_x = {
                            function ()
                                local kmap = vim.opt.keymap:get()
                                if kmap == '' then
                                    return ''
                                end
                                return ' ' .. kmap
                            end,
                            'filetype',
                        }
                    }
                }
            end
        }
        use {
            'neoclide/coc.nvim', branch = 'release',
            config = function ()
               require('cockeys')
                vim.g.coc_default_semantic_highlight_groups = 1
            end
        }
        use 'jreybert/vimagit'
        use 'octol/vim-cpp-enhanced-highlight'
        use {
            'navarasu/onedark.nvim',
            run = function ()
                require('onedark').setup()
            end
        }

        use({
            "kylechui/nvim-surround",
            config = function()
                require("nvim-surround").setup({
                    -- Configuration here, or leave empty to use defaults
                })
            end
        })

        use {
            'nvim-treesitter/nvim-treesitter', ft = 'cs',
            run = ':TSUpdate',
            config = function ()
                vim.api.nvim_command('TSEnable highlight')
            end
        }
        use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                run = 'make'
            }
        },
        config = function ()
            local telescope = require('telescope')
            telescope.load_extension('fzf')
            telescope.load_extension('glyph')

            telescope.setup {
                extensions = {
                    glyph = {
                        action = function(glyph)
                            vim.api.nvim_put({ glyph.value }, 'c', false, true)
                        end
                    }
                }
            }

            local opts = { remap = false }
            local funcs = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', funcs.find_files, opts)
            vim.keymap.set('n', '<leader>fF',
                function ()
                    require('telescope.builtin').find_files {
                        search_dirs = { '~/scripts', '~/.config', '~/Sources', '~/Writing' }
                    }
                end,
            opts)
            vim.keymap.set('n', '<leader>FF',
                function ()
                    require('telescope.builtin').find_files {
                        search_dirs = { '~' },
                        hidden = true
                    }
                end,
            opts)
            vim.keymap.set('n', '<leader>fg',
                function ()
                    require('telescope.builtin').live_grep {
                            grep_open_files = true
                    }
                end,
            opts)
            vim.keymap.set('n', '<leader>fG',
                function ()
                    require('telescope.builtin').live_grep {
                        search_dirs = {
                            '.', require('telescope.utils').buffer_dir()
                        }
                    }
                end,
            opts)
            vim.keymap.set('n', '<leader>fb', funcs.buffers, opts)
            vim.keymap.set('n', '<leader>fh', funcs.help_tags, opts)
            vim.keymap.set('n', '<leader>fs', funcs.current_buffer_fuzzy_find, opts)
            vim.keymap.set('n', '<leader>fm', funcs.man_pages, opts)
            vim.keymap.set('n', '<leader>fe', telescope.extensions.glyph.glyph, opts)
            vim.keymap.set('n', '<leader>ft', funcs.treesitter, opts)
        end
    }
    use 'ghassan0/telescope-glyph.nvim'
    use 'honza/vim-snippets'
end)
