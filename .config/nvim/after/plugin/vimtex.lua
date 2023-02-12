local g = vim.g
local map = vim.fn['vimtex#imaps#add_map']
local log = vim.fn['vimtex#log#info']

g.vimtex_compiler_method = 'latexmk'
g.vimtex_compiler_latexmk = {
    build_dir = '',
    callback = 1,
    continuous = 1,
    executable = 'latexmk',
    hooks = {},
    options = {
      '-verbose',
      '-synctex=1',
      '-interaction=nonstopmode'
    }
}

g.vimtex_view_method = 'zathura'

g.vimtex_syntax_conceal = {
    accents = 1,
    cites = 1,
    fancy = 1,
    greek = 1,
    math_bounds = 0,
    math_delimiters = 0,
    math_fracs = 0,
    math_super_sub = 0,
    math_symbols = 1,
    sections = 1,
    styles = 1
}

map({
   lhs = '<m-i>',
   rhs = '\\item ',
   leader = '',
   wrapper = 'vimtex#imaps#wrap_environment',
   context = { 'itemize', 'enumerate' },
})
map({
   lhs = '<m-ш>',
   rhs = '\\item ',
   leader = '',
   wrapper = 'vimtex#imaps#wrap_environment',
   context = { 'itemize', 'enumerate' },
})

map({
    lhs = 'mx',
    rhs = '\\begin{bmatrix}<CR>',
    wrapper = 'vimtex#imaps#wrap_math'
})

map({
    lhs = 'vx',
    rhs = '\\begin{vmatrix}<CR>',
    wrapper = 'vimtex#imaps#wrap_math',
})

map({
    lhs = '<Space>',
    rhs = ' & ',
    leader = '',
    wrapper = 'vimtex#imaps#wrap_environment',
    context = {'vmatrix', 'bmatrix'}
})

map({
    lhs = 'mx',
    rhs = '\\begin{bmatrix}<CR>',
    wrapper = 'vimtex#imaps#wrap_math',
})

map({
    lhs = 'vx',
    rhs = '\\begin{vmatrix}<CR>',
    wrapper = 'vimtex#imaps#wrap_math',
})

vim.cmd([[
function! DocHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        call system('mytexdoc ' . shellescape(a:context.selected))
    endif
    return 1
endfunction
]])

g.vimtex_doc_handlers = { 'DocHandler' }


local function toggle_shell_escape()
    local config = g.vimtex_compiler_latexmk
    local opts = config.options
    if opts[#opts] == '-shell-escape' then
        opts = table.remove(opts, #opts)
        log('Shell escape disabled!')
    else
        opts = table.insert(opts, '-shell-escape')
        log('Shell escape enabled!')
    end
    g.vimtex_compiler_latexmk = config
    vim.fn['vimtex#state#reload']()
end

vim.keymap.set('n', '<F12>', toggle_shell_escape)
