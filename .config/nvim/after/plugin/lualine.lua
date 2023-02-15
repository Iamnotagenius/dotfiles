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
