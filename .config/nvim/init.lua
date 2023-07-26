local api = vim.api
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local env = vim.env

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.hlsearch = false
opt.incsearch = true
opt.nu = true
opt.rnu = true
opt.showcmd = true
opt.scrolloff = 10
opt.updatetime = 50
opt.showmode = false
opt.wrap = false
opt.cursorline = true
opt.clipboard = 'unnamedplus'
opt.langmap =
'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
opt.guifont = { 'Hack Nerd Font:h14' }
opt.background = 'dark'
g.netrw_liststyle = 3
env.NVIM_TUI_ENABLE_TRUE_COLOR = true
if opt.termguicolors then
    opt.termguicolors = true
end
cmd([[
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startInsert :stopInsert
augroup END
]])

if g.neovide then
    opt.mouse = 'a'
    g.neovide_cursor_vfx_mode = "torpedo"
    g.neovide_refresh_rate = 60
    g.neovide_cursor_vfx_opacity = 120.0
    g.neovide_cursor_vfx_particle_density = 20.0
    g.neovide_cursor_vfx_particle_lifetime = 2.3
    g.neovide_transparency = 1.0
    opt.pumblend = 40

    vim.g.font_step = 1

    vim.keymap.set('n', '<C-->', function()
        local changed = {}
        for _, font in ipairs(opt.guifont:get()) do
            local size = string.match(font, ":h(%d+)")
            local new = string.gsub(font, size, tostring(tonumber(size) - vim.g.font_step), 1)
            table.insert(changed, new)
        end

        opt.guifont = changed
    end)
    vim.keymap.set('n', '<C-=>', function()
        local changed = {}
        for _, font in ipairs(opt.guifont:get()) do
            local size = string.match(font, ":h(%d+)")
            local new = string.gsub(font, size, tostring(tonumber(size) + vim.g.font_step), 1)
            table.insert(changed, new)
        end

        opt.guifont = changed
    end)
end

g.airline_powerline_fonts = true
g['airline#extensions#tabline#enabled'] = true

g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '~/.config/nvim/snippets'
g.airline_theme = 'one'

g.mapleader = ' '

vim.keymap.set({ 'n', 't' }, '<M-=>', function()
    if not vim.g.term_buffer then
        vim.cmd [[below 10%split +terminal]]
        vim.g.term_buffer = api.nvim_get_current_buf()
        for _, chan in ipairs(api.nvim_list_chans()) do
            if chan.buffer == vim.g.term_buffer then
                api.nvim_create_user_command('T', function(command)
                    api.nvim_chan_send(chan.id, command.args .. '\n')
                end, {
                    desc = "Send command to virtual terminal",
                    nargs = 1
                })
            end
        end
        vim.cmd 'startinsert'
        return
    end
    for _, win in ipairs(api.nvim_tabpage_list_wins(0)) do
        local buf = api.nvim_win_get_buf(win)
        if vim.g.term_buffer and vim.g.term_buffer == buf then
            api.nvim_win_hide(win)
            return
        end
    end
    vim.cmd [[below 10%split]]
    api.nvim_win_set_buf(api.nvim_get_current_win(), vim.g.term_buffer)
    vim.cmd 'startinsert'
end)

-- Switch between vim keymaps
vim.keymap.set({ 'i', 'n', 'v' }, '<m-l>', function ()
    opt.keymap = opt.keymap:get() == '' and 'russian-jcukenwin' or ''
    require('lualine').refresh {
        scope = 'tabpage',
        place = { 'statusline' }
    }
    if api.nvim_get_mode().mode == 'i' then
        api.nvim_feedkeys('a', 'nt', false)
    end
end)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', "mzJ`z")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>zz')
vim.keymap.set("n", "<C-s>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set('n', '<leader>x', ':bd<CR>')

local opts = { silent = true, noremap = true, expr = true }
vim.keymap.set({ 'n', 'i' }, '<C-h>', '<C-w><C-h>')
vim.keymap.set({ 'n', 'i' }, '<C-l>', '<C-w><C-l>')
vim.keymap.set({ 'n', 'i' }, '<C-k>', '<C-w><C-k>')
vim.keymap.set({ 'n', 'i' }, '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-g>', '<C-w><C-w>')
vim.keymap.set('n', '<C-t>', ':tabnew<CR>:Telescope buffers<CR>')



require('templates').create_autocmd()
