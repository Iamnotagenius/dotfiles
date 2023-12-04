local function split_args(args)
    local rem = {}
    local stdio = {nil, nil}
    local i = 2
    while i <= #args do
        if args[i] == "<" then
            stdio[1] = args[i + 1]
            i = i + 2
            goto continue
        elseif args[i] == ">" then
            stdio[2] = args[i + 1]
            i = i + 2
            goto continue
        end
        table.insert(rem, args[i])
        ::continue::
        i = i + 1
    end
    if #stdio == 0 then
        stdio = nil
    end
    return {
        program = args[1],
        args = rem,
        stdio = stdio
    }
end


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
dap.adapters = {
    coreclr = {
        type = 'executable',
        command = 'netcoredbg',
        args = {'--interpreter=vscode'}
    },
    codelldb =  {
        type = 'server',
        port = 13000,
        executable = {
            command = vim.env['HOME'] .. '/.local/share/codelldb/extension/adapter/codelldb',
            args = { '--port', '13000' }
        }
    }
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

dap.configurations.c = {
    {
        type = 'codelldb',
        request = 'launch',
        name = 'Run C/C++/Rust debugger',
        program = function ()
            if not vim.g.gdb_args then
                error("options are not provided, call SetArgs first")
            end
            return vim.g.gdb_args.program
        end,
        args = function ()
            if not vim.g.gdb_args then
                error("options are not provided, call SetArgs first")
            end
            return vim.g.gdb_args.args
        end,
        stdio = function ()
            if not vim.g.gdb_args then
                error("options are not provided, call SetArgs first")
            end
            return vim.g.gdb_args.stdio
        end,
        cwd = function ()
            return vim.fn.getcwd()
        end
    }
}

dap.configurations.cpp = dap.configurations.c
dap.configurations.rust = dap.configurations.c

require('dapui').setup()

vim.keymap.set('n', '<leader>du', require('dapui').toggle)
vim.keymap.set({'n', 'v'}, '<leader>dh',
function()
    require('dapui').eval(nil, {enter = true})
end)
vim.api.nvim_create_user_command("SetArgs", function (input)
    vim.g.gdb_args = split_args(input.fargs)
end, {
    desc = "Set arguments to debuggee",
    nargs = '+',
    complete = 'file'
})
