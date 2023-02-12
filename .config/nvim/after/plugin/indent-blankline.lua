vim.api.nvim_set_hl(0, 'IndentBlankLineChar', { nocombine = true, fg = '#353d45' })
vim.api.nvim_set_hl(0, 'IndentBlankLineContextChar', { nocombine = true, fg = '#596169' })

require("indent_blankline").setup {
    show_current_context = true,
    char_blankline = '┊'
}
