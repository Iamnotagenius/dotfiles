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

vim.keymap.set('n', '<leader>gg', neogit.open)

local maps = {
    c = 'commit',
    p = 'pull',
    P = 'push',
    b = 'branch',
    r = 'rebase',
    l = 'log',
    z = 'stash',
    m = 'merge',
    t = 'tag',
}

for letter, action in pairs(maps) do
    vim.keymap.set('n', '<leader>g' .. letter, function()
        neogit.open { action }
    end, { desc = 'Neogit ' .. action })
end

