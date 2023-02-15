vim.fn.sign_define('DapBreakpoint', {text='', texthl='Identifier', linehl='', numhl='Title'})
vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='ErrorMsg', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='', texthl='Question', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='String', linehl='CocBold', numhl=''})

vim.keymap.set('n', '<leader>db', require('dap').toggle_breakpoint)
vim.keymap.set('n', '<leader>dc', require('dap').continue)
vim.keymap.set('n', '<leader>dt', require('dap').terminate)
vim.keymap.set('n', '<leader>dn', require('dap').step_over)
vim.keymap.set('n', '<leader>dsj', require('dap').step_into)
vim.keymap.set('n', '<leader>dsk', require('dap').step_out)
vim.keymap.set('n', '<leader>dk', require('dap').up)
vim.keymap.set('n', '<leader>dj', require('dap').down)
vim.keymap.set('n', '<leader>dr', require('dap').run_to_cursor)

local dap = require('dap')
dap.adapters.coreclr = {
    type = 'executable',
    command = 'netcoredbg',
    args = {'--interpreter=vscode'}
}

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "launch - netcoredbg",
        request = "launch",
        env = {
            DOTNET_ENVIRONMENT = "Development",
            ASPNETCORE_URLS = "http://localhost:5170;https://localhost:7113"
        },
        program = function()
            local proj = vim.g.cs_exe_proj
            if proj == nil then
                error("No executable project")
            end
            return proj.dir .. '/bin/Debug/' .. proj.framework .. '/' .. proj.name .. '.dll'
        end,
    },
}

require('dapui').setup()

vim.keymap.set('n', '<leader>du', require('dapui').toggle)
vim.keymap.set({'n', 'v'}, '<leader>dh',
function()
    require('dapui').eval(nil, {enter = true})
end)
