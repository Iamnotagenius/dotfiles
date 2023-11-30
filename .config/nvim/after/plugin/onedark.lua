local function link(dest, source)
    vim.api.nvim_set_hl(0, dest, { link = source })
end

local bg0 = "none"
local bg1 = "none"

local DiagnosticVirtualTextError = { fg = "$dark_red" }
local DiagnosticVirtualTextWarn = { fg = "$dark_yellow" }
local DiagnosticVirtualTextInfo = { fg = "$dark_cyan" }
local DiagnosticVirtualTextHint = { fg = "$dark_purple" }

local DiffAdd
local DiffDelete

if vim.g.neovide then
    bg0 = "$bg0"
    bg1 = "$bg1"
    DiffAdd = 'DiffAdd'
    DiffDelete = 'DiffDelete'
else
    DiagnosticVirtualTextHint.bg = 'none'
    DiagnosticVirtualTextInfo.bg = 'none'
    DiagnosticVirtualTextWarn.bg = 'none'
    DiagnosticVirtualTextError.bg = 'none'
    DiffAdd = 'DiffAdded'
    DiffDelete = 'DiffRemoved'
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
        Normal = { bg = bg0 },
        EndOfBuffer = { bg = bg0 },
        CursorLine = { bg = bg1 },
        CursorLineNr = { bg = bg1, fg = "$green", fmt = "bold" },
        SignColumn = { bg = bg0 },
        FloatBorder = { bg = bg1 },
        NormalFloat = { bg = bg1 },
        IncSearch = { fg = 'transparent', bg = '$bg3', fmt = 'italic,bold,reverse' },
        Search = { fg = 'transparent', bg = '$bg3', fmt = 'italic,bold' },
        TreesitterContextLineNumber = { fg = "$blue", bg = bg1, fmt = "bold" },
        iblIndent = { fg = "$indent", fmt = "nocombine" },
        iblScope = { fg = "$indent_context", fmt = "nocombine" },
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
        ["@ext.method"] = { fg = "$blue", fmt = "bold" },
        ["@enum"] = { fg = "$saturated_yellow" },
        ["@struct"] = { fg = "$yellow" },
        ["@lsp.type.annotation"] = { fg = "$purple", fmt = "italic" },
        ["@lsp.type.lifetime"] = { fg = "$orange", fmt = "italic" },
        ["@lsp.type.record"] = { fg = "$yellow" },
        ["@lsp.mod.controlFlow"] = { fmt = "italic" },
        ["@lsp.mod.deprecated"] = { fmt = "strikethrough" },
        ["@lsp.mod.declaration"] = { fmt = "bold" },
        LspSignatureActiveParameter = { fmt = "underdotted" },
        InlayHint = { fg = "$light_purple", fmt = "italic" },
        WarningHighlight = { fmt = "undercurl", sp = "$orange" },
        ErrorHighlight = { fmt = "undercurl", sp = "$red" },
        ErrorSign = { fg = "$red", bold = true },
        InfoHighlight = { fmt = "undercurl", sp = "$blue" },
        HintHighlight = { fmt = "undercurl", sp = "$green" },
        MenuSel = { bg = "$grey" },
        DiagnosticVirtualTextError = DiagnosticVirtualTextError,
        DiagnosticVirtualTextWarn = DiagnosticVirtualTextWarn,
        DiagnosticVirtualTextInfo = DiagnosticVirtualTextInfo,
        DiagnosticVirtualTextHint = DiagnosticVirtualTextHint,
        TSRainbowBlue = { fg = "$blue" },
        TSRainbowCyan = { fg = "$cyan" },
        TSRainbowGreen = { fg = "$green" },
        TSRainbowOrange = { fg = "$orange" },
        TSRainbowRed = { fg = "$red" },
        TSRainbowViolet = { fg = "$purple" },
        TSRainbowYellow = { fg = "$yellow" },
        NeogitObjectId = { fg = "$orange" },
        NeogitPopupSectionTitle = { fg = "$yellow", fmt = "bold" },
        NeogitPopupSwitchKey = { fg = "$cyan" },
        NeogitPopupSwitchEnabled = { fg = "$green" },
        NeogitPopupSwitchDisabled = { fg = "$red" },
        NeogitPopupOptionKey = { fg = "$cyan" },
        NeogitPopupOptionEnabled = { fg = "$green" },
        NeogitPopupOptionDisabled = { fg = "$red" },
        NeogitPopupActionKey = { fg = "$purple" },
        NeogitPopupActionDisabled = { fg = "$red" },
        NeogitPopupConfigKey = { fg = "$purple" },
        NeogitPopupConfigDisabled = { fg = "$red" },
        NeogitPopupConfigEnabled = { fg = "$green" },
        NeogitUnstagedChanges = { fg = "$red" },
        NeogitUnmergedChanges = { fg = "$yellow" },
        NeogitUnpulledChanges = { fg = "$blue" },
        NeogitStagedChanges = { fg = "$green" },
        NeogitRecentCommits = { fg = "$cyan" },
        NeogitBranch = { fg = "$blue" },
        NeogitRemote = { fg = "$purple" },
        NeogitCommitMessage = { fg = "$grey", fmt = "italic" }
    }
}

require('onedark').load()

link('@lsp.type.extensionMethod', '@ext.method')
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
link('NeogitDiffAdd', DiffAdd)
link('NeogitDiffDelete', DiffDelete)
