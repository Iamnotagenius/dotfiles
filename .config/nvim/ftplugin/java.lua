vim.api.nvim_set_hl(0, 'javaExternal', { link = '@macro' })

local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
local plugin = vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local jdtls = require('jdtls')
local proj_name = vim.fn.fnamemodify(require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }), ':p:h:t')

require('mason-lspconfig').setup_handlers {
    ["jdtls"] = function()
        jdtls.start_or_attach {
            name = "jdtls",
            cmd = {
                '/usr/lib/jvm/java-21-openjdk/bin/java',

                '-Declipse.application=org.eclipse.jdt.ls.core.id1',
                '-Dosgi.bundles.defaultStartLevel=4',
                '-Declipse.product=org.eclipse.jdt.ls.core.product',
                '-Dlog.protocol=true',
                '-Dlog.level=ALL',
                '-Dmixin.debug.export=true',
                '-Xmx1g',
                '--add-modules=ALL-SYSTEM',
                '--add-opens', 'java.base/java.util=ALL-UNNAMED',
                '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
                -- "-javaagent:" ..
                -- require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok-1.18.30.jar",

                '-jar', plugin,
                '-configuration', install_path .. "/config_linux",
                '-data', vim.fn.expand('~/.cache/jdtls/workspace/') .. proj_name
            },
            init_options = {
                bundles = vim.fn.glob("~/Sources/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar", true)
            },
            on_attach = function ()
                jdtls.setup_dap {
                    hotcodereplace = 'auto'
                }
                require('jdtls.dap').setup_dap_main_class_configs()
            end,
            settings = {
                java = {
                    signatureHelp = {enabled = true},
                    contentProvider = {preferred = 'fernflower'}
                }
            }
        }
    end
}


vim.keymap.set('n', '<leader>i', jdtls.organize_imports)
vim.keymap.set('n', '<leader>v', jdtls.extract_variable)
vim.keymap.set('v', '<leader>e', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')

vim.api.nvim_create_autocmd('User', {
    pattern = 'NeogitBranchCheckout',
    callback = function ()
        vim.cmd('JdtUpdateConfig')
    end
})
