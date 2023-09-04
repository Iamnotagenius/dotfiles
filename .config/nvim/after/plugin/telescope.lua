local telescope = require('telescope')
local fb_actions = telescope.extensions.file_browser.actions
local action_state = require('telescope.actions.state')
local create_with_template = function(prompt_bufnr)
    local templates = require('templates')
    fb_actions.create_from_prompt(prompt_bufnr)
    templates.put_template()
end
telescope.setup {
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
        mvnsearch = {
            rows = 50,
            yank_register = '+'
        },
        ["ui-select"] = {
            require('telescope.themes').get_dropdown {

            }
        }
    }
}

telescope.load_extension('fzf')
telescope.load_extension('glyph')
telescope.load_extension('file_browser')
telescope.load_extension('mvnsearch')
telescope.load_extension('harpoon')
telescope.load_extension('ui-select')

local opts = { remap = false }
local funcs = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', function()
    telescope.extensions.file_browser.file_browser {
        grouped = true,
        cwd = vim.fn.expand('%:p:h')
    }
end, opts)
vim.keymap.set('n', '<leader>fr', funcs.oldfiles, opts)
vim.keymap.set('n', '<leader>ff', funcs.find_files, opts)
vim.keymap.set('n', '<leader>fF',
    function()
        funcs.find_files {
            search_dirs = { '~/scripts', '~/.config', '~/Sources', '~/Writing' }
        }
    end, opts)
vim.keymap.set('n', '<leader>fg',
    function()
        require('telescope.builtin').live_grep {
            grep_open_files = true
        }
    end, opts)
vim.keymap.set('n', '<leader>fG',
    function()
        require('telescope.builtin').live_grep {
            grep_open_files = false
        }
    end, opts)
vim.keymap.set('n', '<leader>fb', funcs.buffers, opts)
vim.keymap.set('n', '<leader>fh', funcs.help_tags, opts)
vim.keymap.set('n', '<leader>fm', funcs.man_pages, opts)
vim.keymap.set('n', '<leader>fe', function()
    telescope.extensions.glyph.glyph {
        layout_strategy = 'cursor',
        layout_config = {
            height = 0.25,
            width = 0.4
        }
    }
end, opts)
vim.keymap.set('n', '<leader>ft', funcs.treesitter, opts)
vim.keymap.set('n', '<leader>m', telescope.extensions.harpoon.marks)
