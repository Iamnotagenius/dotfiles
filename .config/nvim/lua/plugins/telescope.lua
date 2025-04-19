local function create_with_template(prompt_bufnr)
    local fb_actions = require('telescope').extensions.file_browser.actions
    local templates = require('templates')
    fb_actions.create_from_prompt(prompt_bufnr)
    templates.put_template()
end

local funcs = require('telescope.builtin')

return {
    {
        'nvim-telescope/telescope.nvim',
        opts = function ()
            local telescope = require('telescope')
            local fb_actions = require('telescope').extensions.file_browser.actions
            local action_state = require('telescope.actions.state')

            telescope.load_extension('fzf')
            telescope.load_extension('glyph')
            telescope.load_extension('file_browser')
            telescope.load_extension('harpoon')
            telescope.load_extension('ui-select')

            return {
                defaults = {
                    layout_strategy = 'flex',
                    layout_config = {
                        flex = {
                            flip_columns = 85
                        },
                        width = 0.9,
                        preview_cutoff = 10,
                        vertical = {
                            mirror = true,
                            prompt_position = 'top'
                        }
                    },
                },
                extensions = {
                    glyph = {
                        action = function(glyph)
                            vim.api.nvim_put({ glyph.value }, 'c', false, true)
                        end
                    },
                    file_browser = {
                        hijack_netrw = false,
                        mappings = {
                            n = {
                                c = create_with_template,
                                ["<C-d>"] = function(prompt_bufnr)
                                    local entry = action_state.get_selected_entry()
                                    vim.fn.jobstart({ "dragon-drop", entry[1] }, { detach = true })
                                end,
                                I = fb_actions.toggle_respect_gitignore
                            },
                            i = {
                                ["<A-c>"] = create_with_template,
                                ["<C-i>"] = fb_actions.toggle_respect_gitignore
                            }
                        }
                    },
                    ["ui-select"] = {
                        require('telescope.themes').get_dropdown {

                        }
                    }
                }
            }
        end,
        keys = {
            {
                '<leader>fd', function()
                    require('telescope').extensions.file_browser.file_browser {
                        grouped = true,
                        cwd = vim.fn.expand('%:p:h')
                    }
                end, remap = false,
            },
            { '<leader>fr', funcs.oldfiles, remap = false },
            { '<leader>ff', funcs.find_files, remap = false },
            { '<leader>fF',
            function()
                funcs.find_files {
                    search_dirs = { '~/scripts', '~/.config', '~/Sources', '~/Writing' }
                }
            end, remap = false },
            { '<leader>fg',
            function()
                require('telescope.builtin').live_grep {
                    grep_open_files = true
                }
            end, remap = false },
            { '<leader>fG',
            function()
                require('telescope.builtin').live_grep {
                    grep_open_files = false
                }
            end, remap = false },
            { '<leader>fb', funcs.buffers, remap = false },
            { '<leader>fh', funcs.help_tags, remap = false },
            { '<leader>fm', funcs.man_pages, remap = false },
            { '<leader>fe', function()
                require('telescope').extensions.glyph.glyph {
                    layout_strategy = 'cursor',
                    layout_config = {
                        height = 0.25,
                        width = 0.4
                    }
                }
            end, remap = false },
            { '<leader>ft', funcs.treesitter, remap = false },
            { '<leader>m', require('telescope').extensions.harpoon.marks }
        }
    },

    -- Extensions
    'nvim-telescope/telescope-file-browser.nvim',
    'ghassan0/telescope-glyph.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
}
