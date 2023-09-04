vim.api.nvim_set_hl(0, 'javaExternal', { link = '@macro' })

local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
local jdtls = require('jdtls')

require('mason-lspconfig').setup_handlers {
    ["jdtls"] = function()
        jdtls.start_or_attach {
            name = "jdtls",
            cmd = {
                install_path .. "/bin/jdtls",
                "--jvm-arg=" .. string.format(
                    "-javaagent:%s",
                    require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
                ),
            },
            init_options = {
                bundles = {
                    vim.fn.glob(
                    "~/Sources/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
                        1)
                }
            },
            on_attach = function()
                jdtls.setup_dap {
                    hotcodereplace = 'auto'
                }
                require('jdtls.dap').setup_dap_main_class_configs()
            end,
            settings = {
                java = {
                    signatureHelp = { enabled = true },
                    contentProvider = { preferred = 'fernflower' }
                }
            }
        }
    end
}


vim.keymap.set('n', '<leader>i', jdtls.organize_imports)
vim.keymap.set('n', '<leader>v', jdtls.extract_variable)
vim.keymap.set('v', '<leader>e', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')
