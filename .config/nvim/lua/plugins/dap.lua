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

return {
    {
        'mfussenegger/nvim-dap',
        lazy = true,
        init = function ()
            vim.fn.sign_define('DapBreakpoint', {text='', texthl='Identifier', linehl='', numhl='Title'})
            vim.fn.sign_define('DapBreakpointRejected', {text='', texthl='ErrorMsg', linehl='', numhl=''})
            vim.fn.sign_define('DapLogPoint', {text='', texthl='Question', linehl='', numhl=''})
            vim.fn.sign_define('DapStopped', {text='', texthl='String', linehl='CocBold', numhl=''})
        end,
        keys = {
            { '<leader>db', function() require('dap').toggle_breakpoint() end },
            { '<leader>dc', function() require('dap').continue() end },
            { '<leader>dt', function() require('dap').terminate() end },
            { '<leader>dn', function() require('dap').step_over() end },
            { '<leader>dsj', function() require('dap').step_into() end },
            { '<leader>dsk', function() require('dap').step_out() end },
            { '<leader>dk', function() require('dap').up() end },
            { '<leader>dj', function() require('dap').down() end },
            { '<leader>dr', function() require('dap').run_to_cursor() end },
        },
        config = function ()
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
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        lazy = true,
        main = 'dapui',
        dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
        opts = {},
        keys = {
            { '<leader>du', function () require('dapui').toggle() end },
            {
                '<leader>dh',
                function () require('dapui').eval(nil, { enter = true }) end,
                mode = { 'n', 'v' }
            },
        },
        init = function ()
            vim.api.nvim_create_user_command("SetArgs", function (input)
                vim.g.gdb_args = split_args(input.fargs)
            end, {
                desc = "Set arguments to debuggee",
                nargs = '+',
                complete = 'file'
            })
    end
}
}
