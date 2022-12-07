local function hl(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end
vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_member_variable_highlight = 1
vim.g.cpp_class_decl_highlight = 1
vim.g.cpp_experimental_simple_template_highlight = 1
vim.g.cpp_concepts_highlight = 1

-- Semantic highlight
hl('@namespace',      { italic = true, fg = 'LightRed' })
hl('@variable',       { fg = '#56b6c2' })
hl('@property',       { fg = '#e06c75' })
hl('@parameter',      { fg = '#56b6c2', italic = true })
hl('@conditional',               { fg = '#c678dd', italic = true })
hl('@type',  { fg = '#e5c07b' })
hl('@struct',  { fg = '#e6d17c' })
hl('@type.parameter',  { fg = '#e5c07b', italic = true })
hl('@interface',  { fg = '#c9d48f' })
hl('@enum',  { fg = '#f7b158' })
hl('@method',      { fg = '#61afef' })
hl('@ext.method',      { fg = '#61afef', bold = true })

hl('CocSemNamespace',      { italic = true, fg = 'LightRed' })
hl('Macro',                 { bold = true })
hl('Include',               { fg = '#c678dd', bold = true })
hl('cInclude',              { fg = '#c678dd', bold = true })
hl('CocSemVariable',       { fg = '#56b6c2' })
hl('CocSemProperty',       { fg = '#e06c75' })
hl('CocSemParameter',      { fg = '#56b6c2', italic = true })
hl('CocSemTypeParameter',  { fg = '#e5c07b', italic = true })
hl('CocWarningHighlight',   { undercurl = true, sp = 'Orange' })
hl('CocErrorHighlight',     { undercurl = true, sp = '#c70039' })
hl('CocErrorSign',          { ctermfg = 1, fg = '#c70039', bold = true })
hl('CocInfoHighlight',      { undercurl = true, sp = '#61afef' })
hl('CocHintHighlight',      { undercurl = true, sp = '#98c379' })
hl('Search',                { bg = '#3e4452', fg = 'none' })
hl('IncSearch',             { bg = 'none', fg = 'none' })
hl('CocMenuSel',            { bg = '#3e4452' })

hl('DiagnosticVirtualTextError', { fg = '#993939' })
hl('DiagnosticVirtualTextWarn', { fg = '#93691d' })
hl('DiagnosticVirtualTextHint', { fg = '#8a3fa0' })
hl('DiagnosticVirtualTextInfo', { fg = '#2b6f77' })

vim.cmd('hi link ALEWarning CocWarningHighlight')
vim.cmd('hi link ALEError CocErrorHighlight')
vim.cmd('hi link ALEVirtualTextError DiagnosticVirtualTextError')
vim.cmd('hi link ALEVirtualTextWarning DiagnosticVirtualTextWarn')
vim.cmd('hi link ALEVirtualTextInfo DiagnosticVirtualTextInfo')

function SyntaxStack()
    local synstack = vim.fn.synstack
    local idattr = vim.fn.synIDattr
    for _, value in pairs(synstack(unpack(vim.api.nvim_win_get_cursor(0)))) do
        print(idattr(value, 'name'))
    end
end
