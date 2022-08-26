return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'lervag/vimtex',
        config = function ()
            require('vimtex')
        end
    }
    use 'vim-airline/vim-airline'
    use {
        'neoclide/coc.nvim', branch = 'release',
        config = function ()
           require('cockeys')
            vim.g.coc_default_semantic_highlight_groups = 1
        end
    }
    use {
        'vim-airline/vim-airline-themes',
        requires = { 'vim-airline/vim-airline' }
    }
    use 'jreybert/vimagit'
    use 'octol/vim-cpp-enhanced-highlight'

use({
    "kylechui/nvim-surround", branch = 'pattern-matching',
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
})
end)
