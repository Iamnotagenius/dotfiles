local function imap(key, func, opts)
    vim.keymap.set('i', key, func, opts)
end

local function vmap(key, func)
    vim.keymap.set('v', key, func, { silent = true })
end

local function map(key, func)
    vim.keymap.set('n', key, func, { silent = true })
end

local function xmap(key, func)
    vim.keymap.set('x', key, func)
end

local function omap(key, func)
    vim.keymap.set('o', key, func)
end

local function smap(key, func, opts)
    vim.keymap.set('s', key, func, opts)
end

local expr_and_silent = { expr = true, silent = true }

imap('<c-space>', vim.fn['coc#refresh'], expr_and_silent)
map( '<leader>a', '<Plug>(coc-codeaction)')
vmap('<leader>a', '<Plug>(Coc-codeaction-selected)')
map( '<leader>g', '<Plug>(coc-diagnostic-info)')
map( '[g',        '<Plug>(coc-diagnostic-prev)')
map( ']g',        '<Plug>(coc-diagnostic-next)')
map( 'gd',        '<Plug>(coc-definition)')
map( 'gy',        '<Plug>(coc-type-definition)')
map( 'gi',        '<Plug>(coc-implementation)')
map( 'gr',        '<Plug>(coc-references)')
xmap('if',        '<Plug>(coc-funcobj-i)')
omap('if',        '<Plug>(coc-funcobj-i)')
xmap('af',        '<Plug>(coc-funcobj-a)')
omap('af',        '<Plug>(coc-funcobj-a)')
xmap('ic',        '<Plug>(coc-classobj-i)')
omap('ic',        '<Plug>(coc-classobj-i)')
xmap('ac',        '<Plug>(coc-classobj-a)')
omap('ac',        '<Plug>(coc-classobj-a)')
map( '<F2>',      '<Plug>(coc-rename)')
map( 'gl',        '<Plug>(coc-openlink)')
map('<leader>h',  function () vim.fn.CocActionAsync('doHover') end)
map('<leader>s',  function () vim.fn.CocActionAsync('showSignatureHelp') end)
imap('<c-n>', function () vim.fn['coc#pum#next'](false) end, expr_and_silent)
imap('<c-p>', function () vim.fn['coc#pum#prev'](false) end, expr_and_silent)
smap('<TAB>', vim.fn['coc#snippet#next'])
smap('<S-TAB>', vim.fn['coc#snippet#prev'])
vmap('s', '<Plug>(coc-snippets-select)')

-- Auto complete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end
local opts = {silent = true, noremap = true, expr = true}
-- Use tab for trigger completion with characters ahead and navigate.
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file.
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config.
vim.api.nvim_set_keymap("i", "<TAB>",
                        [[coc#jumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" : coc#pum#visible() ? coc#pum#next(0) : "<TAB>"]], opts)
vim.api.nvim_set_keymap("i", "<S-TAB>",
                        [[coc#pum#visible() ? coc#pum#prev(0) : coc#expandableOrJumpable() ? coc#snippet#prev() : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice.
vim.api.nvim_set_keymap("i", "<cr>",
                        [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
