local M = {}
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
            local namespace = ""
            local class = string.match('/' .. context.file, ".*/(.+)%.cs$")
            local keyword
            if class:sub(1, 1) == 'I' then
                keyword = "interface"
            else
                keyword = "class"
            end
            for dir, comp in up_dirs(context.match:gsub("(.*)/.+", "%1")) do
                namespace = comp .. '.' .. namespace
                for filename in lfs.dir(dir .. '/' .. comp) do
                    if filename:match(".+%.csproj$") then
                        return {
                            'namespace ' .. namespace:sub(1, #namespace - 1) .. ';',
                            '',
                            'public ' .. keyword .. ' ' .. class,
                            '{',
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

function M.get_template_function(ext)
    local template = templates[ext]

    if not template then
        return function ()
        end
    end

    template.init_pos = template.init_pos or { 0, 0 }

    local callback
    if type(template.text) == "table" then
        callback = function()
            api.nvim_put(template.text, '', false, false)
            api.nvim_win_set_cursor(0, template.init_pos)
        end
    elseif type(template.text) == "function" then
        callback = function(context)
            local lines
            lines, template.init_pos = template.text(context)
            template.init_pos = template.init_pos or { 0, 0 }
            api.nvim_put(lines, '', false, false)
            api.nvim_win_set_cursor(0, template.init_pos)
        end
    end

    return callback
end

function M.put_template(context)
    context = context or {
        event = 'BufNewFile',
        buf = api.nvim_get_current_buf(),
        file = vim.fn.expand('%'),
        match = vim.fn.expand('%:p')
    }
    local ext = context.file:match(".+%.(.+)$")
    M.get_template_function(ext)(context)
end

function M.create_autocmd()
    local augroup = api.nvim_create_augroup("NewFileTemplates", {})
    for ext, template in pairs(templates) do
        template.init_pos = template.init_pos or { 0, 0 }
        local callback = M.get_template_function(ext)
        api.nvim_create_autocmd('BufNewFile', {
            group = augroup,
            pattern = "*." .. ext,
            desc = "New file template for *." .. ext .. " files",
            callback = callback
        })
    end
end

return M
