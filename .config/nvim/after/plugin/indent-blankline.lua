require("indent_blankline").setup {
    char_blankline = '┊',
    space_char_blankline = " ",
    show_current_context = true,
    filetype_exclude = {
        "dashboard",
        "lspinfo",
        "packer",
        "checkhealth",
        "help",
        "man",
        "",
    }
}
