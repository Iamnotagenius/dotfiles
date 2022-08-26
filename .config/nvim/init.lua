local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local env = vim.env
local api = vim.api

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.nu = true
opt.rnu = true
opt.showcmd = true
opt.showmode = false
opt.hlsearch = false
opt.clipboard = 'unnamedplus'
opt.langmap = 'ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz'
opt.guifont = 'Fira Code Light:h15'
cmd('colorscheme one')
opt.background = 'dark'
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
    require('neovide')
end

g.airline_powerline_fonts = true
g.airline_theme = 'one'
g['airline#extensions#tabline#enabled'] = true

-- Switch between vim keymaps
vim.keymap.set({ 'i', 'n', 'v' }, '<m-l>', function ()
    opt.keymap = opt.keymap:get() == '' and 'russian' or ''
end)
