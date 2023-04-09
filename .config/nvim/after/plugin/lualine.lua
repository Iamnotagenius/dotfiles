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
                    modified = ' ',     -- Text to show when the buffer is modified
                    alternate_file = ' ', -- Text to show to identify the alternate file
                    directory = '',     -- Text to show when the buffer is a directory
                }
            }
        }
    },
    sections = {
        lualine_b = {
            { 'b:gitsigns_head', icon = '' },
            {
                'diff',
                source = function()
                    local gitsigns = vim.b.gitsigns_status_dict
                    if gitsigns then
                        return {
                            added = gitsigns.added,
                            modified = gitsigns.changed,
                            removed = gitsigns.removed
                        }
                    end
                end
            },
            'diagnostics'
        },
        lualine_c = {
            {
                'filename',
                newfile_status = true,
                path = 1,
                symbols = {
                    modified = ' ',
                    readonly = ' ',
                    unnamed  = '',
                    newfile  = ' ﱐ'
                }
            }
        },
        lualine_x = {
            function()
                local kmap = vim.opt.keymap:get()
                if kmap == '' then
                    return ''
                end
                return ' ' .. kmap
            end,
            'fileformat',
            'filetype',
        }
    }
}
