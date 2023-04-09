vim.api.nvim_set_hl(0, 'javaExternal', { link = '@macro' })

local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
local jdtls = require('jdtls')

-- Java lang server
require('lspconfig').jdtls.setup {
    cmd = {
        install_path .. "/bin/jdtls",
        "--jvm-arg=" .. string.format(
            "-javaagent:%s",
            require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
        ),
    },
}

vim.keymap.set('n', '<leader>i', jdtls.organize_imports)
vim.keymap.set('n', '<leader>v', jdtls.extract_variable)
vim.keymap.set('v', '<leader>e', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')
