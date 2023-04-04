local function link(dest, source)
    vim.api.nvim_set_hl(0, dest, { link = source })
end

require('onedark').setup {
    colors = {
        light_red = "#eebbbe",
        light_green = "#c9d48f",
        saturated_yellow = "#f7b158",
        light_purple = "#444c6f",
        dark_cyan = "#2b6f77",
        indent = "#353d45",
        indent_context = "#596169"
    },
    highlights = {
        CursorLineNr = { fg = '$green', bg = '$bg1', fmt = 'bold' },
        IncSearch = { fg = 'transparent', bg = '$bg3', fmt = 'italic,bold,reverse' },
        Search = { fg = 'transparent', bg = '$bg3', fmt = 'italic,bold' },
        TreesitterContextLineNumber = { fg = "$blue", bg = "$bg1", fmt = "bold" },
        IndentBlanklineContextChar = { fg = "$indent_context", fmt = "nocombine" },
        IndentBlanklineContextStart = { sp = "$indent", fmt = "nocombine,underline" },
        ["@constant"] = { fg = "$orange" },
        ["@variable"] = { fg = "$cyan" },
        ["@property"] = { fg = "$red" },
        ["@interface"] = { fg = "$light_green" },
        ["@namespace"] = { fg = "$light_red" },
        ["@parameter"] = { fg = "$cyan", fmt = "italic" },
        ["@type"] = { fg = "$yellow" },
        ["@type.parameter"] = { fg = "$yellow", fmt = "italic" },
        ["@conditional"] = { fg = "$purple", fmt = "italic" },
        ["@method"] = { fg = "$blue" },
        ["@ext.method"] = { fg = "$blue", fmt = "italic" },
        ["@enum"] = { fg = "$saturated_yellow" },
        ["@struct"] = { fg = "$yellow" },
        CocSemAnnotation = { fg = "$purple", fmt = "italic" },
        CocSemLifetime = { fg = "$orange", fmt = "italic" },
        CocSemDeclarationProperty = { fg = "$red", fmt = "italic" },
        CocSemMacro = { fg = "$blue", fmt = "bold" },
        CocInlayHint = { fg = "$light_purple", fmt = "italic" },
        CocWarningHighlight = { fmt = "undercurl", sp = "$orange" },
        CocErrorHighlight = { fmt = "undercurl", sp = "$red" },
        CocErrorSign = { fg = "$red", bold = true },
        CocInfoHighlight = { fmt = "undercurl", sp = "$blue" },
        CocHintHighlight = { fmt = "undercurl", sp = "$green" },
        CocMenuSel = { bg = "$grey" },
        DiagnosticVirtualTextError = { fg = "$dark_red" },
        DiagnosticVirtualTextWarn = { fg = "$dark_yellow" },
        DiagnosticVirtualTextInfo = { fg = "$dark_cyan" },
        DiagnosticVirtualTextHint = { fg = "$dark_purple" },
        TSRainbowBlue = { fg = "$blue" },
        TSRainbowCyan = { fg = "$cyan" },
        TSRainbowGreen = { fg = "$green" },
        TSRainbowOrange = { fg = "$orange" },
        TSRainbowRed = { fg = "$red" },
        TSRainbowViolet = { fg = "$purple" },
        TSRainbowYellow = { fg = "$yellow" }
    }
}

require('onedark').load()

link('CocSemNamespace', '@namespace')
link('Macro', '@macro')
link('Include', '@macro')
link('cInclude', '@macro')
link('CocSemVariable', '@variable')
link('CocSemProperty', '@property')
link('CocSemParameter', '@parameter')
link('CocSemClass', '@type')
link('CocSemInterface', '@interface')
link('CocSemTypeParameter', '@type.parameter')
link('CocSemEnum', '@enum')
link('CocSemMethod', '@method')
link('CocSemEnumMember', '@constant')
link('CocSemModifier', '@keyword')

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
