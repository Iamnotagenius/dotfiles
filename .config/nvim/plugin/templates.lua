local api = vim.api

local function up_dirs(path)
    return
    function (unused, path)
        if path:find("/") then
            local remaining, last = path:match("^(.*)/(.+)$")
            if not remaining then
                return nil
            elseif remaining:len() == 0 then
                return '/', last
            end
            return remaining, last
        end
    end,
    nil,
    path
end

local function table_from_iter(iter, s, val)
    local res = {}
    while true do
        val = iter(s, val)
        if val == nil then break end
        table.insert(res, val)
    end
    return res
end

local templates = {
    tex = {
        text = {
            '\\documentclass{article}',
            '\\usepackage{amsmath,amssymb}',
            '\\usepackage[utf8]{inputenc}',
            '\\usepackage[T2A]{fontenc}',
            '\\usepackage[english,russian]{babel}',
            '\\begin{document}',
            '',
            '\\end{document}'
        },
        init_pos = { 7, 1 }
    },
    c = {
        text = {
            '#include <stdio.h>',
            '#include <stdlib.h>',
            '#include <string.h>',
            '',
            'int main(int argc, char *argv[]) {',
            '    ',
            '}'
        },
        init_pos = { 6, 4 }
    },
    h = {
        text = {
            '#ifndef HEADER',
            '#define HEADER',
            '',
            '#endif'
        },
        init_pos = { 3, 1 }
    },
    cpp = {
        text = {
            '#include <iostream>',
            '#include <string>',
            '',
            'int main(int argc, char *argv[]) {',
            '    ',
            '}'
        },
        init_pos = { 5, 4 }
    },
    cs = {
        text = function(context)
            local lfs = require("lfs")
            local dirs = {}
            local namespace = ""
            local class = string.match('/' .. context.file, ".*/(.+)%.cs$")
            for dir, comp in up_dirs(context.match:gsub("(.*)/.+", "%1")) do
                table.insert(dirs, dir)
                namespace = comp .. '.' .. namespace
                for filename in lfs.dir(dir .. '/' .. comp) do
                    if filename:match(".+%.csproj$") then
                        return {
                            'namespace ' .. namespace:sub(1, #namespace - 1) .. ';',
                            '',
                            'public class ' .. class,
                            '{',
                            '    public ' .. class .. '()',
                            '    {',
                            '    ',
                            '    }',
                            '}'
                        }, { 4, 1 }
                    end
                end
            end

            return {
                'public class ' .. class,
                '{',
                '    public ' .. class .. '()',
                '    {',
                '    ',
                '    }',
                '}'
            }, { 2, 1 }
        end
    }
}

templates.hpp = templates.h

local function set_template(context)
    local template = templates[context.file:match('.+%.(.+)$')]
    if template then
        local text = template.text
        if type(text) == "table" then
            api.nvim_put(template.text, '', false, false)
        elseif type(text) == "function" then
            local lines
            lines, template.init_pos = template.text(context)
            api.nvim_put(lines, '', false, false)
        end
        if template.init_pos then
            api.nvim_win_set_cursor(0, template.init_pos)
        end
    end
end

api.nvim_create_autocmd('BufNewFile', { callback = set_template })
