local api = vim.api

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
    }
}
templates.hpp = templates.h

local function set_template(context)
    local template = templates[context.file:match('.+%.(.+)$')]
    if template then
        api.nvim_put(template.text, '', false, false)
        if template.init_pos then
            api.nvim_win_set_cursor(0, template.init_pos)
        end
    end
end

api.nvim_create_autocmd('BufNewFile', { callback = set_template })
