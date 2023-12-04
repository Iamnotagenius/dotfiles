require('mason').setup {
    ui = {
        border = 'rounded'
    }
}

local lsp = require('lsp-zero').preset {
    float_border = 'rounded',
    manage_nvim_cmp = {
        set_sources = 'recommended',
        set_basic_mappings = true,
        set_extra_mappings = true,
        use_luasnip = true,
        set_format = true,
        documentation_window = true,
    }
}

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, { buffer = bufnr })
end)

lsp.format_on_save({
    servers = {
        ['rust_analyzer'] = { 'rust' },
    }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup_servers({'rust_analyzer'})

-- Use nvim-jdtls for java lang server
lsp.configure('jdtls', {
    autostart = false
})

lsp.configure('omnisharp', {
    enable_import_completion = true,
    on_attach = function(client)
        client.server_capabilities.semanticTokensProvider = {
            full = vim.empty_dict(),
            legend = {
                tokenModifiers = { "static" },
                tokenTypes = {
                    "comment",
                    "excludedCode",
                    "identifier",
                    "keyword",
                    "keywordControl",
                    "number",
                    "operator",
                    "operatorOverloaded",
                    "preprocessorKeyword",
                    "string",
                    "whitespace",
                    "text",
                    "static",
                    "preprocessor_text",
                    "punctuation",
                    "stringVerbatim",
                    "stringEscapeCharacter",
                    "class",
                    "delegate",
                    "enum",
                    "interface",
                    "module",
                    "struct",
                    "typeParameter",
                    "field",
                    "enumMember",
                    "constant",
                    "local",
                    "parameter",
                    "method",
                    "extensionMethod",
                    "property",
                    "event",
                    "namespace",
                    "label",
                    "xml_doc_comment_attribute_name",
                    "xml_doc_comment_attribute_quotes",
                    "xml_doc_comment_attribute_value",
                    "xml_doc_comment_cdata_section",
                    "xml_doc_comment_comment",
                    "xml_doc_comment_delimiter",
                    "xml_doc_comment_entity_reference",
                    "xml_doc_comment_name",
                    "xml_doc_comment_processing_instruction",
                    "xml_doc_comment_text",
                    "xml_literal_attribute_name",
                    "xml_literal_attribute_quotes",
                    "xml_literal_attribute_value",
                    "xml_literal_cdata_section",
                    "xml_literal_comment",
                    "xml_literal_delimiter",
                    "xml_literal_embedded_expression",
                    "xml_literal_entity_reference",
                    "xml_literal_name",
                    "xml_literal_processing_instruction",
                    "xml_literal_text",
                    "regex_comment",
                    "regex_character_class",
                    "regex_anchor",
                    "regex_quantifier",
                    "regex_grouping",
                    "regex_alternation",
                    "regex_text",
                    "regex_self_escaped_character",
                    "regex_other_escape",
                },
            },
            range = true,
        }
    end
})

lsp.setup()

vim.diagnostic.config {
    update_in_insert = true
}

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
lsp.set_sign_icons({
    error = ' ',
    warn = ' ',
    hint = ' ',
    info = ' '
})
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'luasnip' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'path' },
    },
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    formatting = {
        format = function(entry, vim_item)
            if vim.tbl_contains({ 'path' }, entry.source.name) then
                local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
                if icon then
                    vim_item.kind = icon
                    vim_item.kind_hl_group = hl_group
                    return vim_item
                end
            end
            return require('lspkind').cmp_format({ with_text = true })(entry, vim_item)
        end
    }
})

require("lsp_signature").setup {
    hint_prefix = "",
    toggle_key = '<M-x>',
    select_signature_key = '<M-k>',
    transparency = 40
}
