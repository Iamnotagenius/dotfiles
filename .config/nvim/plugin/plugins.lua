---@diagnostic disable: undefined-global
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use_rocks 'luafilesystem'
    use_rocks 'xml2lua'

    use {
        "lukas-reineke/indent-blankline.nvim",
        config = function ()
            vim.cmd [[hi IndentBlankLineChar gui=nocombine guifg=#353d45]]
            vim.cmd [[hi IndentBlankLineContextChar gui=nocombine guifg=#596169]]

            require("indent_blankline").setup {
                show_current_context = true,
                char_blankline = '┊'
            }
        end
    }

    use {
        'glepnir/dashboard-nvim',
        config = function ()
            local db = require('dashboard')
            db.custom_header = function ()
                local girls = {
                    {
                        '',
                        ' ⣇⣿⠘⣿⣿⣿⡿⡿⣟⣟⢟⢟⢝⠵⡝⣿⡿⢂⣼⣿⣷⣌⠩⡫⡻⣝⠹⢿⣿⣷ ',
                        ' ⡆⣿⣆⠱⣝⡵⣝⢅⠙⣿⢕⢕⢕⢕⢝⣥⢒⠅⣿⣿⣿⡿⣳⣌⠪⡪⣡⢑⢝⣇ ',
                        ' ⡆⣿⣿⣦⠹⣳⣳⣕⢅⠈⢗⢕⢕⢕⢕⢕⢈⢆⠟⠋⠉⠁⠉⠉⠁⠈⠼⢐⢕⢽ ',
                        ' ⡗⢰⣶⣶⣦⣝⢝⢕⢕⠅⡆⢕⢕⢕⢕⢕⣴⠏⣠⡶⠛⡉⡉⡛⢶⣦⡀⠐⣕⢕ ',
                        ' ⡝⡄⢻⢟⣿⣿⣷⣕⣕⣅⣿⣔⣕⣵⣵⣿⣿⢠⣿⢠⣮⡈⣌⠨⠅⠹⣷⡀⢱⢕ ',
                        ' ⡝⡵⠟⠈⢀⣀⣀⡀⠉⢿⣿⣿⣿⣿⣿⣿⣿⣼⣿⢈⡋⠴⢿⡟⣡⡇⣿⡇⡀⢕ ',
                        ' ⡝⠁⣠⣾⠟⡉⡉⡉⠻⣦⣻⣿⣿⣿⣿⣿⣿⣿⣿⣧⠸⣿⣦⣥⣿⡇⡿⣰⢗⢄ ',
                        ' ⠁⢰⣿⡏⣴⣌⠈⣌⠡⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣬⣉⣉⣁⣄⢖⢕⢕⢕ ',
                        ' ⡀⢻⣿⡇⢙⠁⠴⢿⡟⣡⡆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣵⣵⣿ ',
                        ' ⡻⣄⣻⣿⣌⠘⢿⣷⣥⣿⠇⣿⣿⣿⣿⣿⣿⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿ ',
                        ' ⣷⢄⠻⣿⣟⠿⠦⠍⠉⣡⣾⣿⣿⣿⣿⣿⣿⢸⣿⣦⠙⣿⣿⣿⣿⣿⣿⣿⣿⠟ ',
                        ' ⡕⡑⣑⣈⣻⢗⢟⢞⢝⣻⣿⣿⣿⣿⣿⣿⣿⠸⣿⠿⠃⣿⣿⣿⣿⣿⣿⡿⠁⣠ ',
                        ' ⡝⡵⡈⢟⢕⢕⢕⢕⣵⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⣀⣈⠙ ',
                        ' ⡝⡵⡕⡀⠑⠳⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⢉⡠⡲⡫⡪⡪⡣ ',
                        ''
                    },
                    {
                        '',
                        ' ⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ ',
                        ' ⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ ',
                        ' ⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ ',
                        ' ⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ ',
                        ' ⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ ',
                        '   ⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ ',
                        '   ⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ ',
                        '   ⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ ',
                        '   ⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ ',
                        '   ⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ ',
                        '    ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ ',
                        '    ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ ',
                        '    ⣿⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ ',
                        ''
                    },
                    {
                        '',
                        ' ⡿⠉⠄⠄⠄⠄⠈⠙⠿⠟⠛⠉⠉⠉⠄⠄⠄⠈⠉⠉⠉⠛⠛⠻⢿⣿⣿⣿⣿⣿ ',
                        ' ⠁⠄⠄⠄⢀⡴⣋⣵⣮⠇⡀⠄⠄⠄⠄⠄⠄⢀⠄⠄⠄⡀⠄⠄⠄⠈⠛⠿⠋⠉ ',
                        ' ⠄⠄⠄⢠⣯⣾⣿⡿⣳⡟⣰⣿⣠⣂⡀⢀⠄⢸⡄⠄⢀⣈⢆⣱⣤⡀⢄⠄⠄⠄ ',
                        ' ⠄⠄⠄⣼⣿⣿⡟⣹⡿⣸⣿⢳⣿⣿⣿⣿⣴⣾⢻⣆⣿⣿⣯⢿⣿⣿⣷⣧⣀⣤ ',
                        ' ⠄⠄⣼⡟⣿⠏⢀⣿⣇⣿⣏⣿⣿⣿⣿⣿⣿⣿⢸⡇⣿⣿⣿⣟⣿⣿⣿⣿⣏⠋ ',
                        ' ⡆⣸⡟⣼⣯⠏⣾⣿⢸⣿⢸⣿⣿⣿⣿⣿⣿⡟⠸⠁⢹⡿⣿⣿⢻⣿⣿⣿⣿⠄ ',
                        ' ⡇⡟⣸⢟⣫⡅⣶⢆⡶⡆⣿⣿⣿⣿⣿⢿⣛⠃⠰⠆⠈⠁⠈⠙⠈⠻⣿⢹⡏⠄ ',
                        ' ⣧⣱⡷⣱⠿⠟⠛⠼⣇⠇⣿⣿⣿⣿⣿⣿⠃⣰⣿⣿⡆⠄⠄⠄⠄⠄⠉⠈⠄⠄ ',
                        ' ⡏⡟⢑⠃⡠⠂⠄⠄⠈⣾⢻⣿⣿⡿⡹⡳⠋⠉⠁⠉⠙⠄⢀⠄⠄⠄⠄⠄⠂⠄ ',
                        ' ⡇⠁⢈⢰⡇⠄⠄⡙⠂⣿⣿⣿⣿⣱⣿⡗⠄⠄⠄⢀⡀⠄⠈⢰⠄⠄⠄⠐⠄⠄ ',
                        ' ⠄⠄⠘⣿⣧⠴⣄⣡⢄⣿⣿⣿⣷⣿⣿⡇⢀⠄⠤⠈⠁⣠⣠⣸⢠⠄⠄⠄⠄⠄ ',
                        ' ⢀⠄⠄⣿⣿⣷⣬⣵⣿⣿⣿⣿⣿⣿⣿⣷⣟⢷⡶⢗⡰⣿⣿⠇⠘⠄⠄⠄⠄⠄ ',
                        ' ⣿⠄⠄⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣾⣿⣿⡟⢀⠃⠄⢸⡄⠁⣸ ',
                        ' ⣿⠄⠄⠘⢿⣿⣿⣿⣿⣿⣿⢛⣿⣿⣿⣿⣿⣿⣿⣿⣿⣟⢄⡆⠄⢀⣪⡆⠄⣿ ',
                        ' ⡟⠄⠄⠄⠄⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢿⣟⣻⣩⣾⣃⣴⣿⣿⡇⠸⢾ ',
                        '',
                    },
                    {
                        '',
                        '⡆⣐⢕⢕⢕⢕⢕⢕⢕⢕⠅⢗⢕⢕⢕⢕⢕⢕⢕⠕⠕⢕⢕⢕⢕⢕⢕⢕⢕⢕',
                        '⢐⢕⢕⢕⢕⢕⣕⢕⢕⠕⠁⢕⢕⢕⢕⢕⢕⢕⢕⠅⡄⢕⢕⢕⢕⢕⢕⢕⢕⢕',
                        '⢕⢕⢕⢕⢕⠅⢗⢕⠕⣠⠄⣗⢕⢕⠕⢕⢕⢕⠕⢠⣿⠐⢕⢕⢕⠑⢕⢕⠵⢕',
                        '⢕⢕⢕⢕⠁⢜⠕⢁⣴⣿⡇⢓⢕⢵⢐⢕⢕⠕⢁⣾⢿⣧⠑⢕⢕⠄⢑⢕⠅⢕',
                        '⢕⢕⠵⢁⠔⢁⣤⣤⣶⣶⣶⡐⣕⢽⠐⢕⠕⣡⣾⣶⣶⣶⣤⡁⢓⢕⠄⢑⢅⢑',
                        '⠍⣧⠄⣶⣾⣿⣿⣿⣿⣿⣿⣷⣔⢕⢄⢡⣾⣿⣿⣿⣿⣿⣿⣿⣦⡑⢕⢤⠱⢐',
                        '⢠⢕⠅⣾⣿⠋⢿⣿⣿⣿⠉⣿⣿⣷⣦⣶⣽⣿⣿⠈⣿⣿⣿⣿⠏⢹⣷⣷⡅⢐',
                        '⣔⢕⢥⢻⣿⡀⠈⠛⠛⠁⢠⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⠛⠛⠁⠄⣼⣿⣿⡇⢔',
                        '⢕⢕⢽⢸⢟⢟⢖⢖⢤⣶⡟⢻⣿⡿⠻⣿⣿⡟⢀⣿⣦⢤⢤⢔⢞⢿⢿⣿⠁⢕',
                        '⢕⢕⠅⣐⢕⢕⢕⢕⢕⣿⣿⡄⠛⢀⣦⠈⠛⢁⣼⣿⢗⢕⢕⢕⢕⢕⢕⡏⣘⢕',
                        '⢕⢕⠅⢓⣕⣕⣕⣕⣵⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣷⣕⢕⢕⢕⢕⡵⢀⢕⢕',
                        '⢑⢕⠃⡈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢃⢕⢕⢕',
                        '⣆⢕⠄⢱⣄⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢁⢕⢕⠕⢁',
                        '⣿⣦⡀⣿⣿⣷⣶⣬⣍⣛⣛⣛⡛⠿⠿⠿⠛⠛⢛⣛⣉⣭⣤⣂⢜⠕⢑⣡⣴⣿',
                        '',
                    },
                    {
                        '',
                        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⡿⠿⢿⣿⣿⣿⣿⣿⣿',
                        '⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠛⠛⠉⠉⠉⠙⠻⣅⠀⠈⢧⠀⠈⠛⠉⠉⢻⣿⣿',
                        '⣿⣿⣿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⣤⡶⠟⠀⠀⣈⠓⢤⣶⡶⠿⠛⠻⣿',
                        '⣿⣿⣿⣿⣿⢣⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⣴⠶⠿⠿⢷⡄⠀⠀⢀⣤⣾⣿',
                        '⣿⣿⣿⣿⣡⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣦⣤⣤⡀⠀⢷⡀⠀⠀⣻⣿⣿',
                        '⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡈⠛⠶⠛⠃⠈⠈⢿⣿⣿',
                        '⣿⣿⠟⠘⠀⠀⠀⠀⠀⠀⠀⠀⢀⡆⠀⠀⠀⠀⠀⠀⣧⠀⠀⠀⠀⠀⠀⠈⣿⣿',
                        '⣿⠏⠀⠁⠀⠀⠀⠀⠀⠀⠀⢀⣶⡄⠀⠀⠀⠀⠀⠀⣡⣄⣿⡆⠀⠀⠀⠀⣿⣿',
                        '⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠚⠛⠛⢛⣲⣶⣿⣷⣉⠉⢉⣥⡄⠀⠀⠀⠨⣿⣿',
                        '⡇⢠⡆⠀⠀⢰⠀⠀⠀⠀⢸⣿⣧⣠⣿⣿⣿⣿⣿⣿⣷⣾⣿⡅⠀⠀⡄⠠⢸⣿',
                        '⣧⠸⣇⠀⠀⠘⣤⡀⠀⠀⠘⣿⣿⣿⣿⣿⠟⠛⠻⣿⣿⣿⡿⢁⠀⠀⢰⠀⢸⣿',
                        '⣿⣷⣽⣦⠀⠀⠙⢷⡀⠀⠀⠙⠻⠿⢿⣷⣾⣿⣶⠾⢟⣥⣾⣿⣧⠀⠂⢀⣿⣿',
                        '⣿⣿⣿⣿⣷⣆⣠⣤⣤⣤⣀⣀⡀⠀⠒⢻⣶⣾⣿⣿⣿⣿⣿⣿⣿⢀⣀⣾⣿⣿',
                        '',
                    },
                    {
                        '',
                        '⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿',
                        '⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿',
                        '⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿',
                        '⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿',
                        '⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀',
                        '⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶',
                        '⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿',
                        '⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿',
                        '⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁',
                        '⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉',
                        '⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶',
                        '⣿⡘⠈⣷⠀⠀⠈⠻⣿⣷⣎⠐⠿⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀',
                        '⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠀',
                        '⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     ',
                        '',
                    }
                }
                math.randomseed(os.time())
                return girls[math.random(#girls)]
            end
            db.custom_center = {
                {
                    icon = '  ',
                    desc = 'Recent files                          ',
                    action = 'Telescope oldfiles',
                    shortcut = '\\fr'
                },
                {
                    icon = '  ',
                    desc = 'Find File                             ',
                    action = 'Telescope find_files hidden=true',
                    shortcut = '\\fF'
                },
                {
                    icon = '  ',
                    desc ='File Browser                          ',
                    action =  'Telescope file_browser',
                    shortcut = '\\ff'
                },
                {
                    icon = '  ',
                    desc = 'Find  word                            ',
                    action = 'Telescope live_grep',
                    shortcut = '\\fg'
                },
            }
        end
    }

    use {
        'lervag/vimtex',
        config = function ()
            require('vimtex')
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
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
        end
    }

    use {
        'neoclide/coc.nvim',
        branch = 'master', run = 'yarn install --frozen-lockfile',
        config = function ()
            require('cockeys')
            vim.g.coc_default_semantic_highlight_groups = true
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

    use {
        "kylechui/nvim-surround", tag = "*",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        requires = { 'p00f/nvim-ts-rainbow' },
        run = ':TSUpdate',
        config = function ()
            require('nvim-treesitter.configs').setup {
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = {
                        "c",
                        "cpp",
                        "help",
                        "man",
                        "cs"
                    }
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                }
            }
        end
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

        config = function ()
            local telescope = require('telescope')
            local fb_actions = telescope.extensions.file_browser.actions
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
                        mappings = {
                            n = {
                                c = create_with_template
                            },
                            i = {
                                ["<S-CR>"] = create_with_template
                            }
                        }
                    }
                }
            }

            telescope.load_extension('fzf')
            telescope.load_extension('glyph')
            telescope.load_extension('file_browser')

            local opts = { remap = false }
            local funcs = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', function ()
                telescope.extensions.file_browser.file_browser {
                    grouped = true,
                    cwd = vim.fn.expand('%:p:h')
                }
            end, opts)
            vim.keymap.set('n', '<leader>fr', funcs.oldfiles, opts) vim.keymap.set('n', '<leader>fF',
            function ()
                require('telescope.builtin').find_files {
                    search_dirs = { '~/scripts', '~/.config', '~/Sources', '~/Writing' }
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
            vim.keymap.set('n', '<leader>fm', funcs.man_pages, opts)
            vim.keymap.set('n', '<leader>fe', function () telescope.extensions.glyph.glyph {
                layout_strategy = 'cursor',
                layout_config = {
                    height = 0.25,
                    width = 0.4
                }
            } end, opts)
            vim.keymap.set('n', '<leader>ft', funcs.treesitter, opts)
        end
    }

    use 'ghassan0/telescope-glyph.nvim'
    use 'honza/vim-snippets'
    use {
        "ziontee113/color-picker.nvim",
        config = function()
            local opts = { noremap = true, silent = true }
            vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>", opts)
            vim.keymap.set("i", "<M-c>", "<cmd>PickColorInsert<cr>", opts)
            require("color-picker").setup { -- for changing icons & mappings
                ["icons"] = { "█", "" },
            }
        end,
    }

    use {
        "mfussenegger/nvim-dap",
        config = function ()
            vim.fn.sign_define('DapBreakpoint', {text='', texthl='Identifier', linehl='', numhl='Title'})
            vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='ErrorMsg', linehl='', numhl=''})
            vim.fn.sign_define('DapLogPoint', {text='', texthl='Question', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='', texthl='String', linehl='CocBold', numhl=''})

            vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
            vim.keymap.set('n', '<leader>dc', require('dap').continue)
            vim.keymap.set('n', '<leader>dt', require('dap').terminate)
            vim.keymap.set('n', '<leader>dn', require('dap').step_over)
            vim.keymap.set('n', '<leader>dsj', require('dap').step_into)
            vim.keymap.set('n', '<leader>dsk', require('dap').step_out)
            vim.keymap.set('n', '<leader>dk', require('dap').up)
            vim.keymap.set('n', '<leader>dj', require('dap').down)
            vim.keymap.set('n', '<leader>dr', require('dap').run_to_cursor)

            local dap = require('dap')
            dap.adapters.coreclr = {
                type = 'executable',
                command = 'netcoredbg',
                args = {'--interpreter=vscode'}
            }

            dap.configurations.cs = {
                {
                    type = "coreclr",
                    name = "launch - netcoredbg",
                    request = "launch",
                    env = {
                        DOTNET_ENVIRONMENT = "Development",
                        ASPNETCORE_URLS = "http://localhost:5170;https://localhost:7113"
                    },
                    program = function()
                        local proj = vim.g.cs_exe_proj
                        if proj == nil then
                            error("No executable project")
                        end
                        return proj.dir .. '/bin/Debug/' .. proj.framework .. '/' .. proj.name .. '.dll'
                    end,
                },
            }
        end
    }

    use {
        "rcarriga/nvim-dap-ui",
        requires = {"mfussenegger/nvim-dap"},
        config = function ()
            require('dapui').setup()

            vim.keymap.set('n', '<leader>du', require('dapui').toggle)
            vim.keymap.set({'n', 'v'}, '<leader>dh',
                function()
                    require('dapui').eval(nil, {enter = true})
                end)
        end
    }

    use 'fatih/vim-go'

    use {
        'OmniSharp/omnisharp-vim', ft = { 'cs', 'csproj' },
        requires = {{'dense-analysis/ale', ft = { 'cs', 'csproj' }}},
        config = function ()
            vim.g.ale_linters = {
                cs = { 'OmniSharp' }
            }
            vim.g.ale_disable_lsp = true
            vim.g.ale_sign_error = ''
            vim.g.ale_sign_warning = ''
            vim.g.ale_echo_cursor = false
            vim.g.ale_virtualtext_cursor = 2
            vim.g.ale_virtualtext_prefix = '<- '
            vim.g.ale_lint_on_text_changed = 'always'
            vim.g.ale_lint_delay = 0
            vim.g.ale_virtualtext_delay = 0

            vim.g.OmniSharp_server_use_net6 = true
            vim.g.OmniSharp_highlighting = 3
            vim.g.OmniSharp_diagnostic_showid = true
            vim.g.OmniSharp_popup_options = {
                winblend = 40,
                border = 'rounded'
            }
            vim.g.OmniSharp_diagnostic_overrides = {
                SA1309 = { type = 'None' },
                IDE0160 = { type = 'None' },
                IDE0008 = { type = 'None' },
            }

            vim.g.OmniSharp_highlight_groups = {
                ClassName = '@type',
                ConstantName = '@constant',
                ControlKeyword = '@conditional',
                DelegateName = '@type',
                EnumMemberName = '@constant',
                EnumName = '@enum',
                EventName = '@type',
                ExtensionMethodName = '@ext.method',
                FieldName = '@variable',
                InterfaceName = '@interface',
                Keyword = '@keyword',
                LocalName = '@variable',
                MethodName = '@method',
                NamespaceName = '@namespace',
                ParameterName = '@parameter',
                PropertyName = '@property',
                StructName = '@struct',
                TypeParameterName = '@type.parameter',
            }

            vim.keymap.set('n', 'gd', '<Plug>(omnisharp_go_to_definition)')
            vim.keymap.set('n', '<leader>r', '<Plug>(omnisharp_run_test)')
            vim.keymap.set('n', '<leader>R', '<Plug>(omnisharp_run_tests_in_file)')
            vim.keymap.set('n', '<leader>y', '<Plug>(omnisharp_preview_definition)')
            vim.keymap.set('n', '<leader>s', '<Plug>(omnisharp_signature_help)')
            vim.keymap.set('n', '<leader>u', '<Plug>(omnisharp_find_usages)')
            vim.keymap.set('n', '<leader>h', '<Plug>(omnisharp_documentation)')
            vim.keymap.set('n', '<leader>i', '<Plug>(omnisharp_find_implementations)')
            vim.keymap.set('n', '<leader>a', '<Plug>(omnisharp_code_actions)')
            vim.keymap.set('n', '<F2>', '<Plug>(omnisharp_rename)')
            vim.keymap.set('n', ']g', '<Plug>(ale_next_wrap)')
            vim.keymap.set('n', '[g', '<Plug>(ale_previous_wrap)')
            vim.keymap.set('i', '<C-s>', '<Plug>(omnisharp_signature_help)')
        end
    }
end)