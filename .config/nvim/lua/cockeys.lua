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

local expr_and_silent = { expr = true, silent = true }

imap('<c-space>', vim.fn['coc#refresh'], expr_and_silent)
map( '<leader>a', '<Plug>(coc-codeaction)')
vmap('<leader>a', '<Plug>(Coc-codeaction-selected)')
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
imap('<c-n>', function () vim.fn['coc#pum#next'](false) end, expr_and_silent)
imap('<c-p>', function () vim.fn['coc#pum#prev'](false) end, expr_and_silent)
