local function nt_git_event()
    require("neo-tree.events").fire_event("git_event")
end

require('gitsigns').setup {
    yadm = {
        enable = true
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']h', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        map('n', '[h', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
        end, { expr = true })

        -- Actions
        map({'n', 'v'}, '<leader>hs', function ()
            local range = nil
            if vim.api.nvim_get_mode().mode == 'v' or vim.api.nvim_get_mode().mode == 'V' then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'x', false)
                range = { vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2] }
            end
            gs.stage_hunk(range)
            nt_git_event()
        end)
        map({'n', 'v'}, '<leader>hr', function ()
            local range = nil
            if vim.api.nvim_get_mode().mode == 'v' or vim.api.nvim_get_mode().mode == 'V' then
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'x', false)
                range = { vim.fn.getpos("'<")[2], vim.fn.getpos("'>")[2] }
            end
            gs.reset_hunk(range)
            nt_git_event()
        end)
        map('n', '<leader>hS', function()
            gs.stage_buffer()
            nt_git_event()
        end)
        map('n', '<leader>hu', function ()
            gs.undo_stage_hunk()
            nt_git_event()
        end)
        map('n', '<leader>hR', function ()
            gs.reset_buffer()
            nt_git_event()
        end)
        map('n', '<leader>hp', gs.preview_hunk)
        map('n', '<leader>hb', function() gs.blame_line { full = true } end)
        map('n', '<leader>tb', gs.toggle_current_line_blame)
        map('n', '<leader>hd', gs.diffthis)
        map('n', '<leader>hD', function() gs.diffthis('~') end)
        map('n', '<leader>td', gs.toggle_deleted)

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}
