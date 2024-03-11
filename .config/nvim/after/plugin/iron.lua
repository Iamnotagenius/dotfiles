local iron = require("iron.core")
local view = require("iron.view")

iron.setup {
    config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
            sh = {
                -- Can be a table or a function that
                -- returns a table (see below)
                command = { "zsh" }
            }
        },
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = view.split.botright('20%', {
            winfixwidth = false,
            winfixheight = false,
        })
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
        send_motion = "<leader>ic",
        visual_send = "<leader>ic",
        send_file = "<leader>if",
        send_line = "<leader>il",
        send_mark = "<leader>im",
        mark_motion = "<leader>imc",
        mark_visual = "<leader>imc",
        remove_mark = "<leader>imd",
        cr = "<leader>i<cr>",
        interrupt = "<leader>i<leader>",
        exit = "<leader>iq",
        clear = "<leader>cl",
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
        italic = true
    },
    ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<leader>rh', '<cmd>IronHide<cr>')
