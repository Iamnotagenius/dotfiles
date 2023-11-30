require("ibl").setup {
    indent = {
        char = '│'
    },
    scope = {
        show_start = false,
        show_end = false,
    },
    exclude = {
        filetypes = {
            "lspinfo",
            "packer",
            "checkhealth",
            "help",
            "man",
            "gitcommit",
            "TelescopePrompt",
            "TelescopeResults",
            "dashboard",
            ""
        }
    }
}
