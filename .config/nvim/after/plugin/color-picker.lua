local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>c", "<cmd>PickColor<cr>", opts)
vim.keymap.set("i", "<M-c>", "<cmd>PickColorInsert<cr>", opts)
require("color-picker").setup { -- for changing icons & mappings
["icons"] = { "█", "" },
            }
