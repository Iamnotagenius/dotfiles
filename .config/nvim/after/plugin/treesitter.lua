require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        disable = {
            "c",
            "cpp",
            "help",
            "man",
            "cs",
            "kotlin",
            "java"
        }
    }
}
