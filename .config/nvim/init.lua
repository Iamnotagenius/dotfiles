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
opt.linebreak = true
opt.showbreak = '> '
opt.showmode = false
opt.wrap = false
opt.cursorline = true
opt.langmap =
'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
opt.guifont = { 'ComicCodeLigatures Nerd Font:h12' }
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

vim.api.nvim_create_user_command('WordMode', 'set invwrap invspell', {
    desc = "Toggle wrap and spell for MS Word like editing"
})
vim.api.nvim_create_user_command('WordModeRussian', 'set invwrap invspell spelllang=ru', {
    desc = "Same as WordMode but set spelllang to russian"
})

if g.neovide then
    opt.mouse = 'a'
    g.neovide_cursor_vfx_mode = "ripple"
    g.neovide_transparency = 1.0
    g.neovide_scroll_animation_length = 0.14
    opt.pumblend = 40

    g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
        vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
        change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
        change_scale_factor(1/1.25)
    end)
end

g.airline_powerline_fonts = true
g['airline#extensions#tabline#enabled'] = true

g.UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit = '~/.config/nvim/snippets'
g.airline_theme = 'one'

g.mapleader = ' '

local terminal = require('terminal')
api.nvim_create_user_command('T', function(command)
    local term = terminal.get_terminal()
    api.nvim_chan_send(term.job, command.args .. '\n')
end, {
    desc = "Send command to virtual terminal",
    nargs = 1
})

vim.keymap.set({ 'n', 't' }, '<M-=>', function()
    local height, _ = math.modf(vim.api.nvim_win_get_height(0) / 3)
    if terminal.toggle_terminal(true, {
        win = -1,
        split = 'below',
        height = height,
    }) then
        vim.cmd 'startinsert'
    end
end)

-- Switch between vim keymaps
vim.keymap.set({ 'i', 'n', 'v' }, '<m-l>', function()
    opt.keymap = opt.keymap:get() == '' and 'russian' or ''
    require('lualine').refresh {
        scope = 'tabpage',
        place = { 'statusline' }
    }
    if api.nvim_get_mode().mode == 'i' then
        api.nvim_feedkeys('a', 'nt', false)
    end
end)

vim.keymap.set({'n', 'v'}, '<leader>y', '"+y')
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p')

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('n', 'J', "mzJ`z")
vim.keymap.set('n', '<C-d>', "<C-d>zz")
vim.keymap.set('n', '<C-u>', "<C-u>zz")
vim.keymap.set('n', '<M-j>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<M-k>', '<cmd>cprev<CR>zz')
vim.keymap.set("n", "<C-s>", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set('n', '<leader>x', ':bd<CR>')

vim.keymap.set({ 'n', 'i' }, '<C-h>', '<C-w><C-h>')
vim.keymap.set({ 'n', 'i' }, '<C-l>', '<C-w><C-l>')
vim.keymap.set({ 'n', 'i' }, '<C-k>', '<C-w><C-k>')
vim.keymap.set({ 'n', 'i' }, '<C-j>', '<C-w><C-j>')
vim.keymap.set('n', '<C-g>', '<C-w><C-w>')
vim.keymap.set('n', '<C-t>', ':tabnew<CR>:Telescope buffers<CR>')
vim.keymap.set('n', 'gl', function ()
    vim.diagnostic.open_float({
        scope = 'line',
        border = 'rounded'
    })
end)
vim.keymap.set('n', 'gL', function ()
    local config = vim.diagnostic.config()
    vim.diagnostic.config({
        virtual_lines = not config.virtual_lines,
        virtual_text = not config.virtual_text
    })
end)

vim.keymap.set('n', '<leader>a', function ()
    vim.lsp.buf.code_action()
end)

vim.keymap.set({'i', 's' }, '<C-f>', function () vim.snippet.jump(1) end, { silent = true })
vim.keymap.set({'i', 's' }, '<C-b>', function () vim.snippet.jump(1) end, { silent = true })

vim.api.nvim_create_user_command("LspLogClear", function ()
    os.remove(vim.lsp.get_log_path())
end, {
    desc = "Clear the lsp log file"
})

vim.diagnostic.config({
    underline = true,
    virtual_text = false,
    virtual_lines = true,
    update_in_insert = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = ' ',
            [vim.diagnostic.severity.INFO] = ' '
        },
    }
})

require('templates').create_autocmd()

require('config.lazy')
