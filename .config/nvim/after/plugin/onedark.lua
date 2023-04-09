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
        ["@macro"] = { fg = "$blue", fmt = "bold" },
        ["@ext.method"] = { fg = "$blue", fmt = "italic" },
        ["@enum"] = { fg = "$saturated_yellow" },
        ["@struct"] = { fg = "$yellow" },
        ["@lsp.type.annotation"] = { fg = "$purple", fmt = "italic" },
        ["@lsp.type.lifetime"] = { fg = "$orange", fmt = "italic" },
        ["@lsp.typemod.property.declaration"] = { fg = "$red", fmt = "italic" },
        ["@lsp.mod.controlFlow"] = { fmt = "italic" },
        ["@lsp.mod.deprecated"] = { fmt = "strikethrough" },
        InlayHint = { fg = "$light_purple", fmt = "italic" },
        WarningHighlight = { fmt = "undercurl", sp = "$orange" },
        ErrorHighlight = { fmt = "undercurl", sp = "$red" },
        ErrorSign = { fg = "$red", bold = true },
        InfoHighlight = { fmt = "undercurl", sp = "$blue" },
        HintHighlight = { fmt = "undercurl", sp = "$green" },
        MenuSel = { bg = "$grey" },
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

link('@lsp.type.namespace', '@namespace')
link('@lsp.type.keyword', '@keyword')
link('@lsp.type.macro', '@macro')
link('Macro', '@macro')
link('Include', '@macro')
link('cInclude', '@macro')
link('@lsp.type.variable', '@variable')
link('@lsp.type.property', '@property')
link('@lsp.type.parameter', '@parameter')
link('@lsp.type.class', '@type')
link('@lsp.type.interface', '@interface')
link('@lsp.type.typeParameter', '@type.parameter')
link('@lsp.type.enum', '@enum')
link('@lsp.type.method', '@method')
link('@lsp.type.enumMember', '@constant')
link('@lsp.type.modifier', '@keyword')
link('CmpItemKindInterface', '@interface')
link('CmpItemEnumMember', '@constant')