local opt = vim.opt
local api = vim.api

local function calculate_indent(line)
    if line:sub(1, 1) == "\t" then
        return opt.tabstop
    end
    local spaces = line:match('^%s*'):len()
    return spaces % opt.tabstop:get()
end

local function prepend_indent(line)
    return string.rep(' ', opt.tabstop:get() - calculate_indent(line)) .. line
end

local function remove_indent(line)
    if line:match('^%s*'):len() > 0 then
        local indent = calculate_indent(line)
        return line:sub((indent == 0 and opt.tabstop:get() or indent) + 1)
    end
    return line
end

vim.keymap.set('n', '<Tab>', function ()
    api.nvim_set_current_line(prepend_indent(api.nvim_get_current_line()))
end)
vim.keymap.set('n', '<S-Tab>', function ()
    api.nvim_set_current_line(remove_indent(api.nvim_get_current_line()))
end)

vim.keymap.set('v', '<Tab>', function ()
    local s = api.nvim_win_get_cursor(0)[1]
    local e = vim.fn.line('v')
    if s > e then
        s, e = e, s
    end
    s = s - 1
    local lines = api.nvim_buf_get_lines(0, s, e, false)
    print(vim.inspect(s), vim.inspect(e))
    for i = 1, #lines do
        lines[i] = prepend_indent(lines[i])
    end
    api.nvim_buf_set_lines(0, s, e, false, lines)
end)

vim.keymap.set('v', '<S-Tab>', function ()
    local s = api.nvim_win_get_cursor(0)[1]
    local e = vim.fn.line('v')
    if s > e then
        s, e = e, s
    end
    s = s - 1
    local lines = api.nvim_buf_get_lines(0, s, e, false)
    for i = 1, #lines do
        lines[i] = remove_indent(lines[i])
    end
    api.nvim_buf_set_lines(0, s, e, false, lines)
end)
