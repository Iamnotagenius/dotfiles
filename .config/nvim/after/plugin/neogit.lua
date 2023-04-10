local neogit = require('neogit')

neogit.setup {
    kind = 'split',
    signs = {
        section = { '', '' },
        item = { '', '' },
    }
}

vim.api.nvim_create_user_command('Yadm', function()
    neogit.open {
        cwd = '~/.local/share/yadm/repo.git'
    }
end, { nargs = 0 })

vim.keymap.set('n', '<leader>g', neogit.open)
vim.keymap.set('n', '<leader>gc', function()
    neogit.open { 'commit' }
end)
vim.keymap.set('n', '<leader>gp', function()
    neogit.open { 'pull' }
end)
vim.keymap.set('n', '<leader>gP', function()
    neogit.open { 'push' }
end)
vim.keymap.set('n', '<leader>gb', function()
    neogit.open { 'branch' }
end)
vim.keymap.set('n', '<leader>gr', function()
    neogit.open { 'rebase' }
end)
