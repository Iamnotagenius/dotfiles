local function link(dest, source)
    vim.api.nvim_set_hl(0, dest, { link = source })
end

vim.g.cpp_class_scope_highlight = 1
vim.g.cpp_member_variable_highlight = 1
vim.g.cpp_class_decl_highlight = 1
vim.g.cpp_experimental_simple_template_highlight = 1
vim.g.cpp_concepts_highlight = 1

local highlights = {
    conditional = { fg = '#c678dd', italic = true },
    constant = { fg = '#d19a66' },
    enum = { fg = '#f7b158' },
    extension_method = { fg = '#61afef', bold = true },
    interface = { fg = '#c9d48f' },
    keyword = { fg = '#c678dd' },
    macro = { fg = '#c678dd', bold = true },
    method = { fg = '#61afef' },
    namespace = { italic = true, fg = 'LightRed' },
    parameter = { fg = '#56b6c2', italic = true },
    property = { fg = '#e06c75' },
    struct = { fg = '#e6d17c' },
    type = { fg = '#e5c07b' },
    type_parameter = { fg = '#e5c07b', italic = true },
    variable = { fg = '#56b6c2' },
}

local function combine(self, add_opts)
    local merged = {}
    for k, v in pairs(self) do
        merged[k] = v
    end
    for k, v in pairs(add_opts) do
        merged[k] = v
    end
    return merged
end

local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

hl('@namespace', highlights.namespace)
hl('@variable', highlights.variable)
hl('@property', highlights.property)
hl('@parameter', highlights.parameter)
hl('@conditional', highlights.conditional)
hl('@type', highlights.type)
hl('@struct', highlights.struct)
hl('@type.parameter', highlights.type_parameter)
hl('@interface', highlights.interface)
hl('@enum', highlights.enum)
hl('@method', highlights.method)
hl('@ext.method', highlights.extension_method)

hl('CocSemNamespace',      highlights.namespace)
hl('Macro',                 highlights.macro)
hl('Include',               highlights.macro)
hl('cInclude',              highlights.macro)
hl('CocSemVariable',       highlights.variable)
hl('CocSemProperty',       highlights.property)
hl('CocSemParameter',      highlights.parameter)
hl('CocSemTypeParameter',  highlights.type_parameter)
hl('CocSemClass', highlights.type)
hl('CocSemInterface', highlights.interface)
hl('CocSemEnum', highlights.enum)
hl('CocSemMethod', highlights.method)
hl('CocSemEnumMember', highlights.constant)
hl('CocSemAnnotation', combine(highlights.keyword, {italic = true}))
hl('CocSemModifier', highlights.keyword)


hl('CocInlayHint',          { fg = '#444c6f', italic = true })
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

link('Search', 'IncSearch')

-- OmniSharp's CocSem groups
link('CocSemClass_name', '@type')
link('CocSemConstant_name', '@constant')
link('CocSemDelegate_name', '@type')
link('CocSemEnum_member_name', '@constant')
link('CocSemEnum_name', '@enum')
link('CocSemEvent_name', '@type')
link('CocSemExtension_method_name', '@ext.method')
link('CocSemField_name', '@variable')
link('CocSemInterface_name', '@interface')
link('CocSemKeyword', '@keyword')
link('CocSemKeyword___control', '@conditional')
link('CocSemLocal_name', '@variable')
link('CocSemMethod_name', '@method')
link('CocSemNamespace_name', '@namespace')
link('CocSemParameter_name', '@parameter')
link('CocSemProperty_name', '@property')
link('CocSemString___escape_character', '@constant')
link('CocSemStruct_name', '@struct')
link('CocSemType_parameter_name', '@type.parameter')

link('CocSemXml_doc_comment___name', '@keyword')
link('CocSemXml_doc_comment___attribute_name', '@property')
link('CocSemXml_doc_comment___attribute_quotes', 'String')
link('CocSemXml_doc_comment___attribute_value', 'String')



function SyntaxStack()
    local synstack = vim.fn.synstack
    local idattr = vim.fn.synIDattr
    for _, value in pairs(synstack(unpack(vim.api.nvim_win_get_cursor(0)))) do
        print(idattr(value, 'name'))
    end
end
