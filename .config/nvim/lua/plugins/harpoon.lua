local function nt_refresh()
    require("neo-tree.sources.manager").refresh("filesystem")
end

return {
    'ThePrimeagen/harpoon',
    config = function ()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')
        vim.keymap.set('n', '<M-a>', function ()
            mark.add_file()
            nt_refresh()
        end)
        vim.keymap.set('n', '<M-n>', ui.nav_next)
        vim.keymap.set('n', '<M-p>', ui.nav_prev)

        for i = 1, 10, 1 do
            vim.keymap.set('n', '<leader>m' .. i % 10, function() ui.nav_file(i) end)

            vim.keymap.set('n', '<leader>mc' .. i % 10, function()
                mark.set_current_at(i)
                nt_refresh()
            end)
        end
    end
}
