local tokens_map = {
    ["excluded code"] = "@excluded",
    ["keyword - control"] = "@conditional",
    ["operator - overloaded"] = "@operator",
    ["preprocessor keyword"] = "@macro",
    ["static symbol"] = "@lsp.mod.controlFlow",
    ["preprocessor text"] = "@macro",
    ["string - verbatim"] = "@function",
    ["string - escape character"] = "@constant",
    ["class name"] = "@type",
    ["delegate name"] = "@type",
    ["enum name"] = "@enum",
    ["interface name"] = "@interface",
    ["module name"] = "@namespace",
    ["struct name"] = "@type",
    ["type parameter name"] = "@type.parameter",
    ["field name"] = "@field",
    ["enum member name"] = "@constant",
    ["constant name"] = "@constant",
    ["local name"] = "@variable",
    ["parameter name"] = "@parameter",
    ["method name"] = "@function",
    ["extension method name"] = "@ext.method",
    ["property name"] = "@property",
    ["event name"] = "@type",
    ["namespace name"] = "@namespace",
    ["label name"] = "@label",
}


vim.api.nvim_create_autocmd('LspTokenUpdate', {
    callback = function(args)
        local token = args.data.token
        vim.lsp.semantic_tokens.highlight_token(
            token,
            args.buf,
            args.data.client_id,
            tokens_map[token.type]
        )
    end,
})
