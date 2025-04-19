return {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.configs',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    opts = {
        auto_install = true,
        highlight = {
            enable = true,
            disable = {
                "c",
                "cpp",
                "help",
                "man",
                "cs",
                "java"
            }
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",

                    ["ia"] = "@parameter.inner",
                    ["aa"] = "@parameter.outer",

                    ["al"] = "@assignment.lhs",
                    ["ar"] = "@assignment.rhs",

                    -- You can optionally set descriptions to the mappings (used in the desc parameter of
                    -- nvim_buf_set_keymap) which plugins like which-key display
                    ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                },
                -- You can choose the select mode (default is charwise 'v')
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * method: eg 'v' or 'o'
                -- and should return the mode ('v', 'V', or '<c-v>') or a table
                -- mapping query_strings to modes.
                selection_modes = {
                    ['@function.outer'] = 'V', -- linewise
                    ['@class.outer'] = 'V', -- blockwise
                },
                include_surrounding_whitespace = function (context)
                    return context.query_string == "@parameter.outer"
                end,
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sl"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>sh"] = "@parameter.inner",
                },
            },
        },
    }
}
